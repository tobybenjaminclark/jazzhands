// Create Event of obj_SpawnObject
file = file_text_open_read("THRILLER.txt");
alarm_count = 0; // Initialize alarm_count
var line_number = 1; // Initialize line number counter
if (file != -1) {
    // Initialize a ds_list to store object names
    object_names = ds_list_create();
	object_times = ds_list_create();
    
    // Read and execute commands until the end of the file
    while (!file_text_eof(file)) {
        // Read the time (in milliseconds) and object name
		var timer_line = file_text_readln(file);
		var name_line = file_text_readln(file);
		var new_linepos = string_pos("\n", timer_line);
		var new_linepos2 = string_pos("\n", name_line);
		var newtimer = string_delete(timer_line, new_linepos, 1);
		var newname = string_delete(name_line, new_linepos2, 1);
		
        var spawn_time = real(newtimer);
        var object_name = newname;
        
        alarm[alarm_count] = spawn_time * room_speed div 1000; // Convert milliseconds to steps
            
		
			
        // Store object name in the ds_list
        ds_list_add(object_names, object_name);
        ds_list_add(object_times, spawn_time);    
		
        // Increase alarm_count for the next alarm slot
        alarm_count++;
        
        // Increment the line number counter
        line_number++;
    }
    
    file_text_close(file);
} else {
    show_message("Failed to open THRILLER.txt");
    instance_destroy(); // Destroy the object if the file cannot be opened
}