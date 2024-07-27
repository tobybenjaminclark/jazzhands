/// @description Insert description here
// You can write your code in this editor

/* rotation */
rot += 1;

/* Draw Foreground */
var room_w = room_width div 2;
var room_h = room_height div 2;

// Calculate the scaling factors for width and height
var scale_w = room_w / sprite_width;
var scale_h = room_h / sprite_height;

// Choose the smaller scaling factor to maintain aspect ratio
var scale_uniform = min(scale_w, scale_h);

if(scale < scale_uniform){
	scale += 0.02;	
}
