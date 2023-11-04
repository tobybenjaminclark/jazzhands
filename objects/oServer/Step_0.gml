client_socket = network_create_socket(network_socket_tcp);

var ip = string("127.0.0.1")
var server = network_connect(client_socket, ip, 8008);
if server < 0
    {
		show_message("not connected")
    }
else
    {
		show_message("connected")
    }