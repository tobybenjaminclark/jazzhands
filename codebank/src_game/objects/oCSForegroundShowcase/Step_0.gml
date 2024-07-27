/// @description Insert description here
// You can write your code in this editor

/* Draw Foregroudn */
var room_w = room_width;
var room_h = room_height;

// Calculate the scaling factors for width and height
var scale_w = room_w / sprite_width;
var scale_h = room_h / sprite_height;

// Choose the smaller scaling factor to maintain aspect ratio
var scale_uniform = min(scale_w, scale_h);

if(x > (room_width - (sprite_width * scale_uniform) - 5)){
	// Calculate the target position
	target_x = (room_width div 2) - ((sprite_width * scale_uniform) div 2);

	// Use LERP to smoothly move the character towards the target position
	x = lerp(x, target_x, 0.2); // Adjust the third parameter (0.1) to control the speed of movement
}
