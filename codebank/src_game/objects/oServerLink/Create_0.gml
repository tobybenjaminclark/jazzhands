/// @description Starts Server to CV Node
/// @author Toby Benjamin Clark
/// @date   16/01/2023

originalString = ""
global.client_socket = network_create_socket(network_socket_tcp);
global.left_hand = "NONE";
global.right_hand = "NONE";
global.cameras = {};
global.chosen_camera = "NONE";
global.server_socket = network_connect_raw_async(global.client_socket, "127.0.0.1", 5005);

if(global.server_socket < 0) show_message("Could not connect! Try turning on the server?");
else
{
	status_message =
	{
	    status: "hello",
	};
	
	send_to_server(status_message);
	

}