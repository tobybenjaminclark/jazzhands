
	/// Scans the custom folder for all worlds.
	/// Custom Levels are stored as /custom/world/level (where one world has many levels)
	function scan_worlds()
	{
		var custom_dirs = ds_list_create()
	
		show_debug_message("Scanning custom/ directory");
	
		var folder = file_find_first(CUSTOM_LEVEL_DIRECTORY, fa_directory);
		while(folder != "") {
			ds_list_add(custom_dirs, folder);
			folder = file_find_next();
		}

		for(var index = 0; index < ds_list_size(custom_dirs); index++) {
			show_debug_message(" - " + custom_dirs[| index]);
		}
	
		return custom_dirs;
	}