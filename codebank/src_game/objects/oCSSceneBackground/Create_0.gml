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

/* Unblur background */
var shake_fx = layer_get_fx("CutsceneBackground");
previous_effect_radius = fx_get_parameter(shake_fx, "g_Radius");
fx_set_parameter(shake_fx, "g_Radius", 0.0);

/* Move background */
var _fx_tint = fx_create("_filter_screenshake");
fx_set_parameter(_fx_tint, "g_Magnitude", 10);
fx_set_parameter(_fx_tint, "g_ShakeSpeed", 0.01);
layer_set_fx("CutsceneBackground", _fx_tint);
	
