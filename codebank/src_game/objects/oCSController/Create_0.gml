/// @description Load the cutscene parameters from a JSON path and initialise cutscene components.
/// @author Amber Swarbrick
/// @date   08/02/2023

audio_stop_all();
state = PRE_CUTSCENE;

// Load the cutscene json file
global.in_cutscene = true;
json_struct = json_parse_from_filepath(file_path);
num_frames =  array_length(json_struct.frames);
frame_index = 0;

/* play intro music */
if struct_exists(json_struct, "sound_loop"){
	var _path = filepath_replace_last_element(file_path, json_struct.sound_loop);
	aud = audio_create_stream(_path);
	snd = audio_play_sound(aud, 0, true);
	
}

cutscene_initialise_components(frame_index, file_path);
