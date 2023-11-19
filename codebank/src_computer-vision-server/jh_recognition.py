
# TOBY AMBER hand Gesture Recognizer

# import necessary packages

try:
    import cv2
    import mediapipe as mp
    import time
except Exception as e:
    print(f"image recognition: failed to import library. {e}")



class GestureRecognition():

    def __init__(self, server, MODEL_PATH:str = r"codebank//src_computer-vision-server//gesture_recognizer.task") -> None:

        # Dictionaries storing the current and previous result of the gesture recognition model.
        self.current_result: {}
        self.previous_result: {}
        
        self.connected:bool

        # CV2 Video Capture instance used to maintain a live webcam stream.
        self.capture:cv2.VideoCapture

        # String containing the relative path to gesture_recogniser.task.
        self.MODEL_PATH:str

        self.server = server
        self.MODEL_PATH = MODEL_PATH
        self.connected = True

        self.current_result = {
            "Left": "Not_Detected",
            "Right": "Not_Detected"
        }

        self.previous_result = {
            "Left": "Not_Detected",
            "Right": "Not_Detected"
        }

        self.capture = cv2.VideoCapture(0)



    def detect_gestures(self, result:mp.tasks.vision.GestureRecognizer) -> None:

        # A list storing the handedness (left, right) of each hand visible.
        handedness:[]

        # A dictionary storing the current gesture of each detected hand.
        data:{}


        handedness = []

        # Initialise each hand to not detected.
        data = {
        "Left": "Not_Detected",
        "Right": "Not_Detected"
        }

        try:


            # Classify the handedness of each hand detected in the frame.
            for x in range(len(result.handedness)):
                handedness.append(result.handedness[x][0].category_name)


            # Classify the gesture of each hand detected in the frame.
            for x in range(len(result.gestures)):
                if(result.gestures[x][0].score > 0.5):
                    data[handedness[x]] = result.gestures[x][0].category_name


            self.current_result["Left"] = data["Left"]
            self.current_result["Right"] = data["Right"]

        
            if(self.current_result["Left"] != self.previous_result["Left"] or self.current_result["Right"] != self.previous_result["Right"]):
                self.previous_result["Left"] = self.current_result["Left"]
                self.previous_result["Right"] = self.current_result["Right"]

                image_string = f"{self.current_result['Left']} {self.current_result['Right']}"
                self.server.send_message(image_string)


        except Exception as e:
            print("Error in classifying hand gestures: ", e)
                


    def receive_image_data(self) -> None:

        options:mp.tasks.vision.GestureRecognizerOptions

        
        options = mp.tasks.vision.GestureRecognizerOptions(
        base_options=mp.tasks.BaseOptions(model_asset_path=self.MODEL_PATH),
        running_mode=mp.tasks.vision.RunningMode.LIVE_STREAM,
        result_callback=self.detect_gestures,
        num_hands=2)

        with mp.tasks.vision.GestureRecognizer.create_from_options(options) as recognizer:

            while self.connected:

                # Read each frame from the webcam
                _, frame = self.capture.read()

                # Get the current time in milliseconds
                timestamp = int(time.time() * 1000)

                # Convert the image to a mediapipe image
                mp_image = mp.Image(image_format=mp.ImageFormat.SRGB, data=frame)

                # Detect and classify all hands in image
                recognition_result = recognizer.recognize_async(mp_image, timestamp)








