/// @description Insert description here
// You can write your code in this editor

// Set the view to follow the player
view_xview[0] = x - view_wview[0] / 2;
view_yview[0] = y - view_hview[0] / 2;

// Clamp the view to the room boundaries
view_xview[0] = clamp(view_xview[0], 0, room_width - view_wview[0]);
view_yview[0] = clamp(view_yview[0], 0, room_height - view_hview[0]);



	