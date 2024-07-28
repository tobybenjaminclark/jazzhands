/// @description Create event to create the background sprite from the path.
/// @author Amber Swarbrick
/// @date   08/02/2023

/* Toby Clark */
/* Check if sound effect exists on frame */
if(audio_path != ""){
	snd = audio_create_stream(audio_path);
	audio_play_sound(snd, 0, false);
}

sprite = sprite_add(path, 1, false, true, 0, 0);
sprite_index = sprite;
