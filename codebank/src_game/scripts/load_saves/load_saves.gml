/// @description Function to load the list of save files from the save directory.
/// @author Toby Benjamin Clark
/// @date   18/01/2023



/**
 * Retrieves an array of save file names from the specified directory.
 *
 * @param {string} save_directory - The directory path where the save files are located.
 * @returns {string[]} An array containing the names of save files in the specified directory.
 */
function get_saves(save_directory)
{
	/* Initial variables, index, array to save to, and current file name. */
	var file_index = 0;
	var file_array = [];
	var file_name = file_find_first(save_directory, fa_directory);
	
	/* While the next file is not none */
	while(file_name != "")
	{
		/* The file is not none, so load the name into the file_array and iterate */
		show_debug_message("Loaded Save " + string(file_index) + " (" + file_name + ").");
	    file_array[file_index] = file_name;
	    file_name = file_find_next();
	    file_index++;
	}
	
	/* Close & Return File Array */
	file_find_close();
	return file_array;
}



/**
 * Loads save files from the specified directory, validates them, and stores them in the global.saves array.
 *
 * @param {string} [save_directory="userbank/*.json"] - The directory path where the save files are located.
 */
function load_saves(save_directory = "userbank/*.json")
{
	/* Sets Selected Save */
	global.selected_save = -1;
	
	/* Get the list of all saves */
	saves = get_saves(save_directory);
	
	/* Initialize list of saves for global.saves */
	global.saves = [];
	var global_save_index = 0;
	for(var save_index = 0; save_index < array_length(saves); save_index++)
	{
		/* Validate & Add Current Save */
		show_message(working_directory + "userbank/" + saves[save_index]);
		current_save = json_parse_from_filepath("userbank/" + saves[save_index])
		if(validate_savefile(current_save, "userbank/" + saves[save_index]))
		{
			global.saves[global_save_index] = current_save;
			global_save_index++;
		}
	}
}