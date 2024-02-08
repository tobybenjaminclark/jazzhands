function cutscene_queue(file_path)
{
	
}

function cutscene_start(file_path, next_room)
{
	// global.queued_room = rmCutscene;
	cutscene_controller = instance_create_layer(0,0, "Instances", oCSController,
	{
		file_path: file_path,
		next_room: next_room
	});
}

function cutscene_initialise_components(frame_index, json_path)
{
	
// retrieve values of components of the cutscene from json file

	if(variable_struct_exists(json_struct, "frames"))
	{
		background_path = cutscene_get_background_path(json_struct.frames[frame_index]);
		foreground_path = cutscene_get_foreground_path(json_struct.frames[frame_index]);
		frame_heading = cutscene_get_heading(json_struct.frames[frame_index]);
		frame_body = cutscene_get_body(json_struct.frames[frame_index]);
	
	}
	else
	{
		show_message("cutscene json file does not have frames attribute");
		return 1;
	}


	// create the objects for the components of the cutscreen
	cutscene_text = instance_create_layer(room_width/2,room_height/2, "instances", oCSText,
	{
		heading: frame_heading,
		body: frame_body
	});

	foreground_path = filepath_replace_last_element(json_path, foreground_path);
	cutscene_foreground = instance_create_layer(0,0, "Instances", oCSForeground,
	{
		path: foreground_path
	});

	background_path = filepath_replace_last_element(json_path, background_path);
	cutscene_background = instance_create_layer(0,0, "Instances", oCSBackground,
	{
		path: background_path
	});

}

function cutscene_delete_components()
{
	instance_destroy(cutscene_foreground);
	instance_destroy(cutscene_text);
	instance_destroy(cutscene_background);
}


function cutscene_get_background_path(frame)
{
	if(variable_struct_exists(frame, "background"))
	{
		return frame.background;
	}
	show_message("background does not exist");
	return 1;
}


function cutscene_get_foreground_path(frame)
{
	if(variable_struct_exists(frame, "foreground"))
	{
		return frame.foreground;
	}
	show_message("foreground does not exist");
	return 1;
}


function cutscene_get_heading(frame)
{
	if(variable_struct_exists(frame, "heading"))
	{
		return frame.heading;
	}
	show_message("heading does not exist");
	return 1;
}

function cutscene_get_body(frame)
{
	if(variable_struct_exists(frame, "body"))
	{
		return frame.body;
	}
	show_message("body does not exist");
	return 1;
}






function cutscene_end()
{
}


function next_frame()
{
}

