try:
    import socket
except Exception as e:
    print("Jazzhands server error, failed to import socket.")


class Server:

    def __init__(self) -> None:
        self.conn: socket
        self.conn = None

    def initialise_connection(self, HOST:str = "127.0.0.1", PORT:int = 5005) -> None:
        """
        Initialise a connection between the GameMaker client and the Python server.
        Host: The IP address of the host to bind the socket to.
        Port: the Port number of the host to bind the socket to.
        """

        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.bind((HOST, PORT))
            print("listening")
            s.listen()
            conn, addr = s.accept()
            self.conn = conn 
            self.handle_connection(addr)

    def handle_connection(self, addr):
        """
        Handle the initialised client connection.
        addr: the IP Address of the host.
        """
        with self.conn:
            print(f"Connected by {addr}")

            # Hold an idle connection on the thread while the server is connected to a client.
            while True: pass  


    def send_message(self, message:str) -> None:
        """
        Send a message to the GameMaker client.
        message: the message to be sent.
        """
        if self.conn and isinstance(self.conn, socket.socket):
            try:
                self.conn.sendall(bytes(message, "utf-8"))
            except Exception as e:
                print("Error occurred while sending:", e)
        else:
            print("No active or valid connection to send the message.")
