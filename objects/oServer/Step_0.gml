
if (result == network_ok) {
    // Connection successful
    var data = network_receive(client_socket, buffer, buffer_size);
    // Process the received data
    show_message("Received data: " + buffer_read_string(data));
    buffer_delete(data);
} else {
    // Connection failed
    show_message("Failed to connect to the server");
}