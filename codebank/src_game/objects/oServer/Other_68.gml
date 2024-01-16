/// @description Handles Server Connection & Parses Hand Data
/// @author Toby Benjamin Clark
/// @date   16/01/2023

var n_id = ds_map_find_value(async_load, "id");
if(n_id == server_socket)
{
    var t = ds_map_find_value(async_load, "type");
    var socketlist = ds_list_create();
	
    if(t == network_type_connect)
	{
        var sock = ds_map_find_value(async_load, "socket");
        ds_list_add(socketlist, sock);
    }
	
    if(t == network_type_data)
	{
        var t_buffer = ds_map_find_value(async_load, "buffer"); 
        var cmd_type = buffer_read(t_buffer, buffer_string);
        
        // Original string
		var originalString = string(cmd_type);

		// Split the string at space
		var stringArray = string_split(originalString, " ");

		// Print the resulting array elements
		if(array_length_1d(stringArray) < 2)
		{
			global.left_hand = "NONE";
			global.right_hand = "NONE";
		}
		else
		{
			global.left_hand = stringArray[0];
			global.right_hand = stringArray[1];
		}
    }
}