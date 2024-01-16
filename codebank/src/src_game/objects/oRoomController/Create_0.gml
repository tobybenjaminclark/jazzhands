/// @description Variable Setup
/// @author Toby Benjamin Clark
/// @date   12/01/2023

global.queued_room = -1;

shake_fx = layer_get_fx("ShakeLayer");
next_room = -1;
shake_intensity = 0;
transitioning = false;
slowing = false;

step = 0;
