function scan_custom_folders()
{
	// grab the first folder
	show_debug_message("Scanning custom/ directory");
	
	folder = file_find_first(working_directory + "custom/*", fa_directory);
	while(folder != "") {
		ds_list_add(custom_dirs, folder);
		folder = file_find_next();
	}

	for(var index = 0; index < ds_list_size(custom_dirs); index++) {
		show_debug_message(custom_dirs[| index]);
	}
}

