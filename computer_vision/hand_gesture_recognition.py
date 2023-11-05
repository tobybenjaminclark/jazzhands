
# TOBY AMBER hand Gesture Recognizer

# import necessary packages

import cv2
import mediapipe as mp
from mediapipe.tasks import python
from mediapipe.tasks.python import vision
import time
import socket
import struct
import time
import json
from threading import Thread

possible_gestures = ["None", "Closed_Fist", "Open_Palm", "Pointing_Up", "Thumb_Down", "Thumb_Up", "Victory", "ILoveYou"]

# Initialize the webcam
cap = cv2.VideoCapture(0)

model_path = r"computer_vision//gesture_recognizer.task"

BaseOptions = mp.tasks.BaseOptions
GestureRecognizer = mp.tasks.vision.GestureRecognizer
GestureRecognizerOptions = mp.tasks.vision.GestureRecognizerOptions
GestureRecognizerResult = mp.tasks.vision.GestureRecognizerResult
VisionRunningMode = mp.tasks.vision.RunningMode

current_result = {
    "Left": "Not_Detected",
    "Right": "Not_Detected"
}

previous_result = {
    "Left": "Not_Detected",
    "Right": "Not_Detected"
}


def initialise_connection():

    HOST = "127.0.0.1"
    PORT = 5005

    while True:

        print(f"current result server: {current_result}")

        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.bind((HOST, PORT))
            print("listening")
            s.listen()
            conn, addr = s.accept()
            with conn:
                print(f"Connected by {addr}")
                try:
                    while True:
                        if(current_result["Left"] != previous_result["Left"] or current_result["Right"] != previous_result["Right"]):
                            previous_result["Left"] = current_result["Left"]
                            previous_result["Right"] = current_result["Right"]

                            image_string = f"{current_result['Left']} {current_result['Right']}"
                            print(image_string)
                            conn.sendall(bytes(image_string, "utf-8"))
                except:
                    pass


def setup_image():
    options = GestureRecognizerOptions(
    base_options=BaseOptions(model_asset_path=model_path),
    running_mode=VisionRunningMode.LIVE_STREAM,
    result_callback=print_result,
    num_hands=2)

    return options

def receive_image_data(options):

    with GestureRecognizer.create_from_options(options) as recognizer:

        while True:

            # Read each frame from the webcam
            _, frame = cap.read()

            # Get the current time in milliseconds
            timestamp = int(time.time() * 1000)

            mp_image = mp.Image(image_format=mp.ImageFormat.SRGB, data=frame)
            recognition_result = recognizer.recognize_async(mp_image, timestamp)

            cv2.imshow("frame", frame)

            if cv2.waitKey(1) == ord('q'):
                break

    # release the webcam and destroy all active windows
    cap.release()

    cv2.destroyAllWindows()

# Create a gesture recognizer instance with the live stream mode:
def print_result(result: GestureRecognizerResult, output_image: mp.Image, timestamp_ms: int):

    handedness = []

    data = {
    "Left": "Not_Detected",
    "Right": "Not_Detected"
    }


    for x in range(len(result.handedness)):
        handedness.append(result.handedness[x][0].category_name)


    for x in range(len(result.gestures)):

        if(result.gestures[x][0].score > 0.5):
            data[handedness[x]] = result.gestures[x][0].category_name


    current_result["Left"] = data["Left"]
    current_result["Right"] = data["Right"]

    """if(current_result["Left"] != previous_result["Left"] or current_result["Right"] != previous_result["Right"]):
                previous_result["Left"] = current_result["Left"]
                previous_result["Right"] = current_result["Right"]

                print(f"current result client: {current_result}")

                #return f"left: {current_result['Left']} right: {current_result['Right']}"""
            
            





#initialise_connection()

thread = Thread(target=initialise_connection)

thread.start()

options = setup_image()

receive_image_data(options)




