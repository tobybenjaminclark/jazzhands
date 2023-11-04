server_socket = network_create_server(network_socket_tcp, 8008, 5);
if (server_socket < 0)
{
	show_mesage("Failed to initialize server!");
	game_end(1);
}