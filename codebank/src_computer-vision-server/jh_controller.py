from jh_recognition import GestureRecognition
from jh_tcp_server import Server

try:
    from threading import Thread
except Exception as e:
    print("JazzHands Server Setup: Failed to import 'Thread' from module 'threading'")
    quit(1)

def setup() -> None:
    # Create an instance of the TCP Server.
    server_instance = Server()

    # Create an instance of the recognition class, passing the TCP Server as a parameter.
    computer_vision_instance = GestureRecognition(server_instance)

    # Create a thread which initialises the server.
    thread = Thread(target=computer_vision_instance.server.initialise_connection)
    thread.start()

    computer_vision_instance.receive_image_data()

if __name__ == "__main__":
    setup()
    quit(0)



