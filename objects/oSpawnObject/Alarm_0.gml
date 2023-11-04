// Alarm 0 Event of obj_SpawnObject
show_debug_message("Alarm 0 triggered");
if (ds_list_size(object_names) > 0) {
	
	var object_side = object_sides[| 0];
	var xoffset = 0
	if (object_side == "RIGHT")
	{
		xoffset = x + 100;
	}
	else
	{
		xoffset = x - 100;
	}
	
    // Get the object name from the ds_list
    var object_name = ds_list_find_value(object_names, 0);
	
	show_debug_message("Object Name is {0}", object_name);
    if (object_name == "OPEN_HAND") {
        a=instance_create_layer(xoffset, y, "Instances", oSymbol);
		a.stype = "OPEN_HAND";
		a.sprite_index = sprOpenHand;
    } else if (object_name == "VICTORY") {
		a=instance_create_layer(xoffset, y, "Instances", oSymbol);
		a.stype = "VICTORY";
		a.sprite_index = sprVictory;
    } else {
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