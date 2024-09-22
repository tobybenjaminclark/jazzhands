// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_to_server(msg_struct)
{
	var t_buffer = buffer_create(256, buffer_grow, 1);
    buffer_seek(t_buffer, buffer_seek_start, 0);
	

	
	status_json = json_stringify(msg_struct);

    buffer_write(t_buffer , buffer_string, status_json);
    network_send_packet(global.client_socket, t_buffer, buffer_tell(t_buffer));
    buffer_delete(t_buffer);

}