var n_id = ds_map_find_value(async_load, "id");
if(n_id == server_socket){
    var t = ds_map_find_value(async_load, "type");
    var socketlist = ds_list_create();
    if(t == network_type_connect){
        var sock = ds_map_find_value(async_load, "socket");
        ds_list_add(socketlist, sock);
    }
    if(t == network_type_data){
        var t_buffer = ds_map_find_value(async_load, "buffer"); 
        var cmd_type = buffer_read(t_buffer, buffer_string);
        
        show_message(cmd_type);
    }
    //show_message("Something happened!");
}