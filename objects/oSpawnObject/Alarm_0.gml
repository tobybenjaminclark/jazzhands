// Alarm 0 Event of obj_SpawnObject
show_debug_message("Alarm 0 triggered");
if (ds_list_size(object_names) > 0) {
    // Get the object name from the ds_list
    var object_name = ds_list_find_value(object_names, 0);
	show_debug_message("Object Name is {0}", object_name);
    if (object_name == "OPEN_HAND") {
        a=instance_create_layer(x, y, "Instances", oSymbol);
		a.stype = "OPENHAND";
    } else if (object_name == "CLOSED_FIST") {
		a=instance_create_layer(x, y, "Instances", oSymbol);
		a.stype = "CLOSEDFIST";
    } else {
        show_message("Invalid object name (" + object_name + ") in THRILLER.txt");
    }
    
	current_timer = object_times[|0];
	if(ds_list_size(object_times) > 1)
	{
	
		next_time = object_times[|1];
		new_time = (next_time - current_timer);
		show_message("Reset alarm! for " + string(new_time));
		alarm_set(0, new_time * room_speed div 1000);
	}
	
    // Remove the processed command from the ds_list
	ds_list_delete(object_times, 0);
    ds_list_delete(object_names, 0);
    alarm_count--;
} else {
    // No more commands to execute, you might want to destroy the object or handle it according to your game logic
    instance_destroy();
}