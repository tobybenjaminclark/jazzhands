/// @description Insert description here
// You can write your code in this editor

global.queued_room = -1;

shake_fx = layer_get_fx("ShakeLayer");
next_room = -1;
shake_intensity = 0;
transitioning = false;
slowing = false;

step = 0;
