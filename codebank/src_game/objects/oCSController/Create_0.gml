/// @description Load the cutscene parameters from a JSON path and initialise cutscene components.
/// @author Amber Swarbrick
/// @date   08/02/2023

// load the cutscene json file

json_struct = json_parse_from_filepath(file_path);

num_frames =  array_length(json_struct.frames);

frame_index = 0;

cutscene_initialise_components(frame_index, file_path);

