function read_next_timer_and_set_alarm(file)
{
	// Script: read_next_timer_and_set_alarm
	if (!file_text_eof(file)) {
	    var timer_line = file_text_readln(file);
	    var new_linepos = string_pos("\n", timer_line);
	    var newtimer = string_delete(timer_line, new_linepos, 1);
	    var spawn_time = real(newtimer);
    
	    // Set the alarm based on the timer read from the file
	    alarm[alarm_count] = spawn_time * room_speed div 1000;
    
	    // Increment alarm_count for the next alarm slot
	    alarm_count++;
	} else {
	    // No more timers to read, you might want to destroy the object or handle it according to your game logic
	    instance_destroy();
	}
}
