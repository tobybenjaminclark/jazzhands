/// @description Increment the cutscene frame on key press.
/// @author Amber Swarbrick
/// @date   08/02/2023

frame_index++;

if(frame_index >= num_frames)
{
	show_message("cutscene finished :)");
	// global.queued_room = next_room;
	return;
}

cutscene_delete_components();
cutscene_initialise_components(frame_index, file_path);
