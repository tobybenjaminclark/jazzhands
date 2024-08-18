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

// Get the ID of the background layer by its name
// Make it the background (for the 
var layer_id = layer_get_id("Background");
var bg_element_id = layer_background_get_id(layer_id);
layer_background_sprite(bg_element_id, sprite);
layer_background_stretch(bg_element_id, true);
layer_x(layer_id, 0);
layer_y(layer_id, 0);

/* Set blur */
var shake_fx = layer_get_fx("CutsceneBackground");
fx_set_parameter(shake_fx, "g_Radius", 15);