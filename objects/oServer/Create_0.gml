client_socket = network_create_socket(network_socket_tcp);

ip = string("192.168.1.1'")
server = network_connect(client_socket, ip, 8008);
if server < 0
{
	show_message("not connected")
}
else
{
	show_message("connected")
}