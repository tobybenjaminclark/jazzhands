// Async Networking Event
var nEvent = ds_map_find_value(async_load, "type");
switch (nEvent) {
    case network_type_connect:
        var socket = ds_map_find_value(async_load, "socket");
        var ip = ds_map_find_value(async_load, "ip");
        ds_list_add(sSocketList, socket);
        show_debug_message("Client connected! "+ip);
    break;
    case network_type_connect:
        var socket = ds_map_find_value(async_load, "socket");
        var findSocket = ds_list_find_index(sSocketList, socket);
        var ip = ds_map_find_value(async_load, "ip");
        if (findSocket >= 0) {
            ds_list_delete(sSocketList, findSocket);
        }
        show_debug_message("Client disconnected! "+ip);
    break;
    case network_type_data:
        var buffer = ds_map_find_value(async_load, "buffer");
        var socket = ds_map_find_value(async_load,"id");
        var ip = ds_map_find_value(async_load, "ip");
        show_debug_message("Got packet from "+ip);
        buffer_seek(buffer, buffer_seek_start, 0);
        var msgid = buffer_read(buffer, buffer_u8);
        switch (msgid) {
            case 50:
                var data = buffer_read(buffer,buffer_u16);
                show_debug_message("Data: "+string(data));
            break;
        }
    break;
}