// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_new_save(username, hex_code)
{
	/* Validate Username for Length & Exists */
	if(!is_string(username)) return "Username is not a string";
	if(string_length(username) < 3) return "Username is too short";
	if(string_length(username) > MAX_SAVEFILE_NAME_LENGTH) return "Username is too long";
	
	/* Validate Username doesn't already exist. */
	for(var save_index = 0; save_index < array_length(global.saves); save_index++)
	{
		if(global.saves[save_index].username == username) return "Save with this username already exists.";
	}
	
	/* Create the base user statistics */
	var statistics_struct = {};
	statistics_struct.beats_hit = 0;
	statistics_struct.beats_missed = 0;
	statistics_struct.songs_played = 0;
	
	/* Create the Save Struct & assign base values */
	var save_struct = {};
	save_struct.username = username;
	save_struct.hex_code = hex_code;
	save_struct.statistics = statistics_struct;
	
	/* Save! */
	rv = json_save(save_struct, "userbank/" + username + ".json");
	return "success";
	
}