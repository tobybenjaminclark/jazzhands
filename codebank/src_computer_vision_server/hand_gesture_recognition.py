# JazzHands | JazzHandsGetureRecognizer
# Written by Amber Swarbrick 06/01/2024
# Code Review Passed by Toby Clark 06/01/2024

import cv2
import mediapipe as mp

import time
from queue import Queue
from typing import Dict, List
import numpy as np
import threading
import json
import sys


class JazzHandsGestureRecognizer():
    stop_event: threading.Event      # Event to signal the termination of the thread.
    gesture_queue: Queue             # Queue to transfer data from the subthread to the main thread.
    thread: threading.Thread         # Thread to continously retrieve gestures from webcam input.
    current_result: Dict[str,str]    # Dictionary mapping handedness to gesture (e.g. left: OPEN_HAND)
    previous_result: Dict[str,str]   # Dictionary storing the previous contents of current_result.

    def __init__(self, settings):
        """
        Initialise the stop event and gesture queue.
        """

        # Retrieve the settings.ini declarations.
        self.settings = settings

        self.frame = None

        # Create an event to signal the subthreads to safely stop execution.
        self.stop_event: threading.Event = threading.Event()
        self.gesture_queue = Queue()

    def start_thread(self) -> None:
        """
        Create and start the gesture recognition thread.
        """
        self.create_thread()
        
    def create_thread(self) -> threading.Thread:
        """
        Create the gesture recognition thread.
        """

        # ',' used in thread args to convert the single argument to a tuple.
        self.thread: threading.Thread
        self.thread = threading.Thread(
            target=self.begin_retrieval, args=(self.stop_event,)
        )
        self.thread.start()

        # self.calibration_thread: threading.Thread
        # self.calibration_thread = threading.Thread(
        #     target=self.handle_camera
        # )
        # self.calibration_thread.start()


    def stop_thread(self) -> None:
        """
        Stops the thread using the stop event
        """

        self.stop_event.set()
        self.thread.join()

    def setup_image(self, queue: Queue) -> mp.tasks.vision.GestureRecognizerOptions:
        """
        Initialise the options for the mp.tasks.vision.GestureRecognizer instance.

        Args:
            queue: A Queue shared between the gesture_recognition_thread and the controller used to send gesture information to the main thread.
            current_result: A dictionary storing the current gestures recognised for the left and right hands.
            previous_result: A dictionary storing the previous gestures recognised for the left and right hands.
        """

        # mp.tasks: mediapipe tasks API.
        # Used to load the Deep Learning model for the Gesture Recognition task and initialise the options related to the task.

        self.MEDIAPIPE_PATH = self.settings["MEDIAPIPE_PATH"]
        if getattr(sys, 'frozen', False):
            self.MEDIAPIPE_PATH = self.settings.resource_path(self.MEDIAPIPE_PATH)

        options: mp.tasks.vision.GestureRecognizerOptions = mp.tasks.vision.GestureRecognizerOptions(
            base_options=mp.tasks.BaseOptions(
                model_asset_path=self.MEDIAPIPE_PATH
            ),
            running_mode=mp.tasks.vision.RunningMode.LIVE_STREAM,
            result_callback=(lambda x, u1, u2: self.handle_gestures(x, queue)),
            num_hands=2,
        )

        return options

    def receive_image_data(self, recognizer: mp.tasks.vision.GestureRecognizer, cap: cv2.VideoCapture) -> None:
        """
        Retrieve a frame from the webcam and retrieve the gestures from the frame.

        Args:
            recognizer: the instance of mp.tasks.vision.GestureRecognizer used to recognize gestures.
            cap: the cv2.VideoCapture instance retrieving live data from the webcam.
        """

        
        # Read each frame from the webcam

        self.frame: np.array  # a numpy array containing the current image data received from the webcam.
        valid_frame: bool  # a boolean defining whether the image returned is valid.
        (
            valid_frame,
            self.frame,
        ) = cap.read()

        # valid_frame = false implies there is an error in reading images from the webcam.
        if not valid_frame:
            print("not valid frame!!!!!!!!!!!!!!!!!!!!!")
            return None
        
        mp_image: mp.Image = mp.Image(image_format=mp.ImageFormat.SRGB, data=self.frame)
        recognizer.recognize_async(mp_image, int(time.time() * 1000))

        # Display the frame in OpenCV.
        # Fix for macOS (uncomment to break macOS support, at your demise.)
        # cv2.imshow("frame", self.frame)
        # cv2.waitKey(1)

        return None

    def handle_gestures(self, result: mp.tasks.vision.GestureRecognizerResult, queue: Queue) -> None:
        """
        Callback function for the mp.tasks.vision.GestureRecognizer instance. Handle retrieval of gestures from the image.

        Args:
            result: The mp.tasks.vision.GestureRecognizerResult containing the gesture information retrieved from the image.
            queue: A Queue shared between the gesture_recognition_thread and the controller used to send gesture information to the main thread.
        """

        # List Comprehension that retrieves handedness from each result
        handedness: List[str] = [hand[0].category_name for hand in result.handedness]

        for x in range(len(result.gestures)):
            if result.gestures[x][0].score > 0.5:
                self.current_result[handedness[x]] = result.gestures[x][0].category_name

        if not self.hands_changed():
            return None

        self.previous_result["Left"] = self.current_result["Left"]
        self.previous_result["Right"] = self.current_result["Right"]

        image_json = json.dumps(self.current_result)

        

        queue.put(image_json)

        return None

    def hands_changed(self) -> bool:
        """
        Returns a boolean describing whether the current gestures detected are different from the previous gestures.
        """

        if (
            self.current_result["Left"] == self.previous_result["Left"]
            and self.current_result["Right"] == self.previous_result["Right"]
        ):
            return False
        else:
            return True

    def begin_retrieval(self, stop_event) -> None:
        """
        Initialise the webcam feed and gesture recognition detection.

        Args:
            queue: A Queue shared between the gesture_recognition_thread and the controller used to send gesture information to the main thread.
            stop_event: A threading.Event instance that will be set once the thread should terminate.
        """

        # Initialise the options for the mp.tasks.vision.GestureRecognizer instance.
        options: mp.tasks.vision.GestureRecognizerOptions = self.setup_image(
            self.gesture_queue
        )

        # Initialise the webcam feed using the constant WEBCAM_ID.
        cap: np.array = cv2.VideoCapture(int(self.settings["WEBCAM_ID"]))

        self.current_result = {"Left": "None", "Right": "None"}
        self.previous_result = {"Left": "None", "Right": "None"}

        # Create Mediapipe Gesture Recognizer
        recognizer: mp.tasks.vision.GestureRecognizer
        recognizer = mp.tasks.vision.GestureRecognizer.create_from_options(options)

        while not stop_event.is_set():
            self.receive_image_data(recognizer, cap)

        return None

    # need a thing to say whether the camera is too dark or too cluttered
    # this should call when no hands have been detected for a while (5 seconds?)
    

    def handle_camera(self) -> None:
        """
        Handles camera calibration to detect if the surroundings are too dark etc.
        """

        while True:

            print(self.is_image_too_dark)

            darkness_data = json.dumps({"Too_Dark": self.is_image_too_dark()})
            self.gesture_queue.put(darkness_data)

            time.sleep(5)

        
        
    def is_image_too_dark(self) -> bool:
        if(self.frame is not None):
            THRESHOLD = int(self.settings["THRESHOLD"])
            is_light = np.mean(self.frame) > THRESHOLD
            return False if is_light else True
        return False