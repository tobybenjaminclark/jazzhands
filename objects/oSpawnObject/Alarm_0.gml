// Alarm 0 Event of obj_SpawnObject
if (ds_list_size(object_names) > 0) {
	
	var object_side = object_sides[| 0];
	
	var xoffset = 0
	var side = "LEFT";
	if (string_char_at(object_side, 1) == "R")
	{
		xoffset = x + 100;
		side = "RIGHT";
	}
	else
	{
		xoffset = x - 100;
	}
	
    // Get the object name from the ds_list
    var object_name = ds_list_find_value(object_names, 0);
	
		// Original string
	var originalString = object_name;

	// Get the length of the string
	var stringLength = string_length(originalString);

	// Check if the string is not empty
	if (stringLength > 0) {
	    // Remove the last character from the string
	    var modifiedString = string_delete(originalString, stringLength - 1, 1);
    
	    // Output the modified string
	    show_debug_message("Modified String: " + modifiedString);
	} else {
	    // Handle empty string case if necessary
	    show_debug_message("String is empty.");
	}
	
	object_name = modifiedString;

	
	show_debug_message("Object Name is {0}", object_name);
    if (object_name == "OPEN_HAND" || object_name == "OPEN_HAND\n" || object_name == "OPEN_HAN" || object_name == "OPEN_PAL\n"|| object_name == "OPEN_HAN\n" || object_name == "OPEN_PAL\n") {
        a=instance_create_layer(xoffset, y, "Instances", oSymbol);
		a.stype = "OPEN_HAND";
		a.side = side;
		a.sprite_index = sprOpenHand;
    } else if (object_name == "VICTORY" || object_name == "VICTORY\n"|| object_name == "VICTOR\n"|| object_name == "VICTOR") {
		a=instance_create_layer(xoffset, y, "Instances", oSymbol);
		a.stype = "VICTORY";
		a.side = side;
		a.sprite_index = sprVictory;
	} else if (object_name == "THUMB_UP" || object_name == "THUMB_UP\n" || object_name == "THUMB_U" || object_name == "THUMB_U\n") {
		a=instance_create_layer(xoffset, y, "Instances", oSymbol);
		a.stype = "THUMB_UP";
		a.side = side;
		a.sprite_index = sprThumbsUp;
    } else if (object_name == "THUMB_DOWN" || object_name == "THUMB_DOWN\n" || object_name == "THUMB_DOW" || object_name == "THUMB_DOW\n") {
		a=instance_create_layer(xoffset, y, "Instances", oSymbol);
		a.stype = "THUMB_DOWN";
		a.side = side;
		a.sprite_index = sprThumbsDown;
    }else if (object_name == "POINTING_UP" || object_name == "POINTING_UP\n" || object_name == "POINTING_U" || object_name == "POINTING_U\n") {
		a=instance_create_layer(xoffset, y, "Instances", oSymbol);
		a.stype = "POINTING_UP";
		a.side = side;
		a.sprite_index = sprPointingUp;
    }else {
        show_message("Invalid object name (" + object_name + ") in THRILLER.txt");
    }

	current_timer = object_times[|0];
	if(ds_list_size(object_times) > 1)
	{
	
		next_time = object_times[|1];
		new_time = (next_time - current_timer);
		alarm_set(0, new_time * room_speed div 1000);
	}

    // Remove the processed command from the ds_list
	ds_list_delete(object_times, 0);
    ds_list_delete(object_names, 0);
	ds_list_delete(object_sides, 0);
    alarm_count--;
} else {
    // No more commands to execute, you might want to destroy the object or handle it according to your game logic
    instance_destroy();
}