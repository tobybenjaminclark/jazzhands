// Create Event of obj_SpawnObject
if(global.SONG_SELECTED == "THRILLER")
{
	file = file_text_open_read("THRILLER.txt");
}
else
{
	file = file_text_open_read("RASPUTIN.txt");
}

alarm_count = 0; // Initialize alarm_count
triggered_alarm_count = 0;
line_number = 0;
var line_number = 1; // Initialize line number counter
if (file != -1) {
    // Initialize a ds_list to store object names
    object_names = ds_list_create();
	object_times = ds_list_create();
	object_sides = ds_list_create();
    
    // Read and execute commands until the end of the file
    while (!file_text_eof(file)) {
        // Read the time (in milliseconds) and object name
			
		var timer_line = file_text_readln(file);
		var name_line = file_text_readln(file);
		var side_line = file_text_readln(file);
		line_number = line_number + 3;
		var new_linepos = string_pos("\cr\lf", timer_line);
		var new_linepos2 = string_pos("\cr\lf", name_line);
		var new_linepos3 = string_pos("\cr\lf", side_line);
		
		var newtimer = string_delete(timer_line, new_linepos, 1);
		var newname = string_delete(name_line, new_linepos2, 1);
		var newside = string_delete(side_line, new_linepos3, 1);
		
		try
		{
			var spawn_time = real(newtimer);
		}
		catch(e)
		{
			show_message("Error parsing near line " + string(line_number))
			show_message("NAME WAS " + newname);
			show_message("TIMER was " + newtimer);
			show_message("SIDE was " + newside);
		}
       
		if(triggered_alarm_count == 0)
		{
			alarm[alarm_count] = spawn_time * room_speed div 1000; // Convert milliseconds to steps
			triggered_alarm_count = 1;
		}
            
        // Store object name in the ds_list
		show_debug_message("Added {0} at {1} at side {2}", newname, string(spawn_time), newside);
        ds_list_add(object_names, newname);
        ds_list_add(object_times, spawn_time); 
		ds_list_add(object_sides, newside);
		
        // Increase alarm_count for the next alarm slot
        alarm_count++;
        
        // Increment the line number counter
        line_number++;
    }
	
    alarm[3] = (spawn_time + 1000) * room_speed div 1000;
	
    file_text_close(file);
} else {
    show_message("Failed to open file");
    instance_destroy(); // Destroy the object if the file cannot be opened
}

// Play sound
alarm[1] = 6 * room_speed;