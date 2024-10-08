/// @description Insert description here
// You can write your code in this editor

if((floor(show_index) != string_length(body)))
{
	/* Display all text */
	show_index = string_length(body);
}
else
{
	/* Skip Cutscene */
	with(oCSController)
	{
		frame_index++;
		if(frame_index >= num_frames)
		{
			cutscene_delete_components();
			instance_destroy(self);
			global.in_cutscene = false;
			audio_stop_all();
			instance_create_layer(x, y, "Instances", oSpinner);
			if self.next_room != room {
				global.queued_room = self.next_room;
			}
			return;
		}

		cutscene_delete_components();
		cutscene_initialise_components(frame_index, file_path);
	}
}