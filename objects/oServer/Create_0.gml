// Create Event
server = network_create_server_raw(network_socket_tcp, 8008, 10);
sBuffer = buffer_create(1024,buffer_fixed,1);
sSocketList = ds_list_create()