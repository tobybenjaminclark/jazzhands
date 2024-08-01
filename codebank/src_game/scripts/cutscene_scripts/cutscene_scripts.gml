function cutscene_queue(file_path)
{
	
}

function cutscene_start(file_path, next_room)
{
	// global.queued_room = rmCutscene;
	cutscene_controller = instance_create_layer(0,0, "Cutscene", oCSController,
	{
		file_path: file_path,
		next_room: next_room
	});
}

function cutscene_initialise_components(frame_index, json_path)
{
	var _type = CS_NONE;
	// retrieve values of components of the cutscene from json file
	if(variable_struct_exists(json_struct, "frames"))
	{	
		if(json_struct.frames[frame_index].type == "dialogue") _type = CS_DIALOGUE;
		else if(json_struct.frames[frame_index].type == "showcase") _type = CS_SHOWCASE;
		else if(json_struct.frames[frame_index].type == "scene") _type = CS_SCENE;
		
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


	/* Make Foreground */
	foreground_path = filepath_replace_last_element(json_path, foreground_path);
	if(_type == CS_SHOWCASE){
		cutscene_foreground = instance_create_layer(0,0, "Cutscene", oCSForegroundShowcase,
		{
			path: foreground_path,
			parent: self
		});
		
		cutscene_text = instance_create_layer(room_width/2,room_height/2, "Cutscene", oCSTextShowcase,
		{
			heading: frame_heading,
			body: frame_body,
			parent: self
		});
	}
	else if(_type == CS_DIALOGUE){
		cutscene_foreground = instance_create_layer(0,0, "Cutscene", oCSForeground,
			{
				path: foreground_path,
				parent: self
			});
		
		cutscene_text = instance_create_layer(room_width/2,room_height/2, "Cutscene", oCSText,
		{
			heading: frame_heading,
			body: frame_body,
			parent: self
		});
	}
	else if(_type == CS_SCENE) {
		cutscene_text = instance_create_layer(room_width/2,room_height/2, "Cutscene", oCSTextScene,
		{
			heading: frame_heading,
			body: frame_body,
			parent: self
		});	
	}

	background_path = filepath_replace_last_element(json_path, background_path);
	
	/* Audio */
	if(struct_exists(json_struct.frames[frame_index], "sound_effect")){
		snd_path = filepath_replace_last_element(json_path, json_struct.frames[frame_index].sound_effect);
	}
	else {
		snd_path = "";	
	}
	
	if(_type != CS_SCENE){
		cutscene_background = instance_create_layer(0,0, "CutsceneBackground", oCSBackground,
			{
				path: background_path,
				parent: self,
				audio_path: snd_path
			});
	}
	else if(_type == CS_SCENE){
		cutscene_background = instance_create_layer(0,0, "CutsceneBackground", oCSSceneBackground,
			{
				path: background_path,
				parent: self,
				audio_path: snd_path
			});	
	}
}

function cutscene_delete_components()
{
	instance_destroy(cutscene_foreground);
	instance_destroy(cutscene_background);
	instance_destroy(cutscene_text);
	
	var shake_fx = layer_get_fx("CutsceneBackground");
	fx_set_parameter(shake_fx, "g_Radius", 0);
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

