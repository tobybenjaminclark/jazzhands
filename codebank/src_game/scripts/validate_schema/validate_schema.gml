// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function validate_schema(level_map, file_path)
{
	/* Validating Events & Level Data */
	if(!ds_map_exists(level_map, "level_data")) show_message("Level `" + string(file_path) + "` - missing 'level_data' attribute");
	if(!ds_map_exists(level_map, "events")) show_message("Level `" + string(file_path) + "` - missing 'events' attribute");
	
	/* Validating Level Data */
	var level_data = level_map[? "level_data"];
	if(!ds_map_exists(level_data, "level_name")) show_message("Level `" + string(file_path) + ".leveldata - missing 'level_name' attribute");
	if(!ds_map_exists(level_data, "description")) show_message("Level `" + string(file_path) + ".leveldata - missing 'description' attribute");
	if(!ds_map_exists(level_data, "background")) show_message("Level `" + string(file_path) + ".leveldata - missing 'background' attribute");
	if(!ds_map_exists(level_data, "song")) show_message("Level `" + string(file_path) + ".leveldata - missing 'song' attribute");
	
}	