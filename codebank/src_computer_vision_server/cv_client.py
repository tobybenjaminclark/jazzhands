# JazzHands | GMS2Client
# Written by Amber Swarbrick 06/01/2024
# Code Review Passed by Toby Clark 06/01/2024

import socket
import threading
from queue import Queue


class GMS2Client():
    stop_event: threading.Event     # Event to signal the termination of the thread.
    client_queue: Queue             # Queue to transfer data from the subthread to the main thread.
    thread: threading.Thread        # Client thread to maintain client-server connection.

    def __init__(self, settings):
        """
        Initializes stop event & client queue
        """

        # Retrieve the settings.ini declarations.
        self.settings = settings

        # Create an event to signal the subthreads to safely stop execution.
        self.stop_event = threading.Event()

        self.client_queue = Queue()

    def start_thread(self) -> None:
        """
        Initialise & Start the Client thread.
        """

        self.thread = self.create_thread()
        self.thread.start()

    def create_thread(self) -> threading.Thread:
        """
        Create the Client thread.
        Returns: the client thread instance.
        """

        # ',' used in thread args to convert the single argument to a tuple.
        gesture_recognition_thread: threading.Thread
        gesture_recognition_thread = threading.Thread(
            target=self.handle_connection_tcp, args=(self.stop_event,)
        )
        return gesture_recognition_thread
    
    def stop_thread(self) -> None:
        """
        Stop the client thread using the stop_event.
        """

        self.stop_event.set()
        self.thread.join()

    def handle_connection_tcp(self, stop_event:threading.Event) -> bool:
        """
        Initialise the connection to the server.
        Handle message transmission between the client and server.

        Args:
            client_queue: A Queue shared between the client thread and controller. Stores messages to be sent from the client to the server.
            stop_event: A threading.Event instance that will be set once the thread should terminate.
        """

        # Initialise the socket and bind it to the specified host, at the specified port.
        sock: socket.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        sock.bind(( self.settings["HOST"], int(self.settings["PORT"]) ))
        print("listening")
        sock.listen()
        sock.settimeout(int(self.settings["SOCKET_TIMEOUT"]))

        # Attempt connection to the server.
        try:
            conn: socket.socket
            conn, _ = sock.accept()

        # Handle socket timeout
        except socket.timeout:
            print("Failed to connect to GMS2 due to timeout.\nTry increasing timeout length in settings.ini")
            return False
        except Exception as e:
            raise e

        with conn:  
            self.mainloop(stop_event, conn)

    def mainloop(self, stop_event: threading.Event, conn:socket.socket) -> None:
        """
        Send messages to the GMS2 server if any are queued.
        """
        while not stop_event.is_set():
            if not self.client_queue.empty():
                data: str = self.client_queue.get()
                conn.send(bytes(data,encoding=self.settings["ENCODING"]))
            else:
                pass
        return None
                