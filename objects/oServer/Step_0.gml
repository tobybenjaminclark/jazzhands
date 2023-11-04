
// Connect to the server

if (server) {
    // Connection successful
    var data = network_receive(client_socket, buffer, buffer_size);
    // Process the received data
    show_message("Received data: " + buffer_read_string(data));
    buffer_delete(data);
} else {
    // Connection failed
	draw_text(x,y,"FAILED TO CONNECT!");
}