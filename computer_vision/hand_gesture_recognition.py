# TechVidvan hand Gesture Recognizer

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

possible_gestures = ["None", "Closed_Fist", "Open_Palm", "Pointing_Up", "Thumb_Down", "Thumb_Up", "Victory", "ILoveYou"]

# Initialize the webcam
cap = cv2.VideoCapture(0)

model_path = r"computer_vision/gesture_recognizer.task"

BaseOptions = mp.tasks.BaseOptions
GestureRecognizer = mp.tasks.vision.GestureRecognizer
GestureRecognizerOptions = mp.tasks.vision.GestureRecognizerOptions
GestureRecognizerResult = mp.tasks.vision.GestureRecognizerResult
VisionRunningMode = mp.tasks.vision.RunningMode

current_result = {
    "Left": None,
    "Right": None
}

previous_result = {
    "Left": None,
    "Right": None
}

s = None

def initialise_connection():
    TCP_IP = '127.0.0.1'
    TCP_PORT = 1045

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind((TCP_IP, TCP_PORT))
        print("listening")
        s.listen()
        conn, addr = s.accept()
        with conn:
            print(f"Connected by {addr}")
            options = setup_image()
            while True:
                image_data = receive_image_data(options)
                conn.sendall(image_data)

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
            # Show the final output
            cv2.imshow("Output", frame) 

            if(current_result["Left"] != previous_result["Left"] or current_result["Right"] != previous_result["Right"]):
                print(current_result)
                previous_result["Left"] = current_result["Left"]
                previous_result["Right"] = current_result["Right"]

                return current_result


    # release the webcam and destroy all active windows
    cap.release()

    cv2.destroyAllWindows()

def send_data(gesture_data):

    data_string = json.dumps(gesture_data)
    s.send(data_string)
    time.sleep(.1)

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


try:
    initialise_connection()
    connected = True
except Exception as e:
    print(e)
    connected = False

print(f"connected: {connected}")


