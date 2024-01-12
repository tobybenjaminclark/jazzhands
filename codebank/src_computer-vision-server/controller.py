# JazzHands | JazzHandsController
# Written by Amber Swarbrick 06/01/2024
# Code Review Passed by Toby Clark 06/01/2024

from SettingsReader import JazzHandsSettingsReader
from hand_gesture_recognition import JazzHandsGestureRecognizer
from cv_client import GMS2Client
from queue import Queue

class JazzhandsController(JazzHandsSettingsReader):
    running: bool                                   # A flag to determine if the program has ended. Facilitates safe termination of threads.
    client: GMS2Client                              # An instance of the cv_client.Client object (communicates to GMS2 server)
    client_queue: Queue                             # An instance of the client queue. Facilitates sending gesture data to the client object.
    gesture_recognizer: JazzHandsGestureRecognizer  # An instance of the hand_gesture_recognition.GestureRecognition object.
    gesture_queue: Queue                            # An instance of the gesture_recognition queue. Allows transmission of gesture data to the client.

    def __init__(self) -> None:
        """
        Main function which initiates the client and gesture recognition.
        """

        # Retrieve the settings.ini declarations.
        super().__init__()

        self.create_client()
        self.create_gesture_recognizer()

        # Boolean flag to continuously run the controller until a stopping condition is met.
        self.running = True
        
    def create_client(self) -> None:
        """
        Creates a thread which initialises the client.
        """

        self.client = GMS2Client()
        self.client_queue: Queue = self.client.client_queue
        self.client.start_thread()

    def create_gesture_recognizer(self) -> None:
        """
        Creates a thread which initialises the gesture recognition.
        """

        self.gesture_recognizer = JazzHandsGestureRecognizer()
        self.gesture_queue: Queue = self.gesture_recognizer.gesture_queue
        self.gesture_recognizer.start_thread()

    def mainloop(self) -> None:
        """
        Program Main Loop. Retrieves gesture detections and sends them to GameMaker server.
        """
        while self.running:
            self.update_client()
        return None

    def update_client(self) -> None:
        """
        Attempt to update the client. Handle keyboard interrupt exceptions.
        """
        try:
            self.try_transmit_to_client()

        # The program will safely end upon a keyboard interrupt (Ctrl+C).
        except KeyboardInterrupt:
            self.terminate_program()
        except Exception as e:
            raise e
    
    def terminate_program(self) -> None:
        """
        Safely end all threads and terminate the main process.
        """
        print("CTRL+C has been pressed. Ending threads.")
        self.gesture_recognizer.stop_thread()
        self.client.stop_thread()
        self.running = False
        exit(0)

    def try_transmit_to_client(self) -> bool:
        """
        Attempt to send the most recent gesture from gesture_queue to the GMS2 server.
        """
        if not self.gesture_queue.empty():
            gestures: str = self.gesture_queue.get()
            print(gestures)
            self.client_queue.put(gestures)
            return True
        else:
            return False


if __name__ == "__main__":
    controller = JazzhandsController()
    controller.mainloop()
