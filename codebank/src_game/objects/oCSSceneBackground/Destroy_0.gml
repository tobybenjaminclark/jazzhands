/// @description Insert description here
// You can write your code in this editor

/* Clear current effects */
var _fx_tint = layer_get_fx("CutsceneBackground");
fx_set_parameter(_fx_tint, "g_Magnitude", 0);
fx_set_parameter(_fx_tint, "g_ShakeSpeed", 0);

_fx_tint = fx_create("_filter_large_blur");
var shake_fx = layer_get_fx("CutsceneBackground");
fx_set_parameter(shake_fx, "g_Radius", previous_effect_radius);
layer_set_fx("CutsceneBackground", _fx_tint);
	