/// @description Draw the background onto the cutscene.
/// @author Amber Swarbrick
/// @date   08/02/2023

var x_scale = room_width / sprite_width;
var y_scale = room_height / sprite_height;

// Draw the sprite stretched to the room's dimensions
draw_sprite_ext(sprite_index, 0, 0, 0, x_scale, y_scale, 0, c_white, 1);

