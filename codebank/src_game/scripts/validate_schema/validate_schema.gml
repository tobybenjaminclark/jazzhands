// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function validate_schema(level_map, file_path)
{
	/* Validating Events & Level Data */
	if(!variable_struct_exists(level_map, "level_data")) show_message("Level `" + string(file_path) + "` - missing 'level_data' attribute");
	if(!variable_struct_exists(level_map, "events")) show_message("Level `" + string(file_path) + "` - missing 'events' attribute");
	
	/* Validating Level Data */
	var level_data = level_map.level_data;
	if(!variable_struct_exists(level_data, "level_name")) show_message("Level `" + string(file_path) + ".leveldata - missing 'level_name' attribute");
	if(!variable_struct_exists(level_data, "description")) show_message("Level `" + string(file_path) + ".leveldata - missing 'description' attribute");
	if(!variable_struct_exists(level_data, "background")) show_message("Level `" + string(file_path) + ".leveldata - missing 'background' attribute");
	if(!variable_struct_exists(level_data, "song")) show_message("Level `" + string(file_path) + ".leveldata - missing 'song' attribute");
	
	/* Validating Events */
	var events = level_map.events
	if(!is_array(level_map.events)) show_message("Level `" + string(file_path) + "` - is not of type `Array`");
	else
	{
		/* Iterating through each event */
		for(var event_index = 0; event_index < array_length(level_map.events); event_index++)
		{
			if(!variable_struct_exists(events[event_index], "event_data")) show_message("Event " + string(event_index) + " missing attribute `event_data`");
			if(!variable_struct_exists(events[event_index], "event_type")) show_message("Event " + string(event_index) + " missing attribute `event_type`");
			
			/* Validating Event Data */
			else
			{
				switch(events[event_index].event_type)
				{	
					case "beat":
						show_debug_message("Parsing event beat at " + string(variable_struct_get(events[event_index].event_data, "time")));
						if(!variable_struct_exists(events[event_index].event_data, "time")) show_message("Event " + string(event_index) + " beatdata (`beat`) missing attribute `time`");
						if(!variable_struct_exists(events[event_index].event_data, "symbol")) show_message("Event " + string(event_index) + " beatdata (`beat`) missing attribute `symbol`");
						if(!variable_struct_exists(events[event_index].event_data, "side")) show_message("Event " + string(event_index) + " beatdata (`beat`) missing attribute `side`");
					break;
						
					case "hold":
					break;
						
					default:
					break;
				}
			}
		}
	}
}	