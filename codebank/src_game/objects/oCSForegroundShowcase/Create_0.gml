/// @description Create the foreground sprite from the given path.
/// @author Amber Swarbrick
/// @date   08/02/2023



// Load the sprite
sprite = sprite_add(path, 1, false, true, 0, 0);
rot = 0;

sprite_index = sprite;

// Set the origin to the center of the sprite
sprite_set_offset(sprite, sprite_width / 2, sprite_height / 2);
sprite_index = sprite;

scale = 0;

/* Draw Foreground */
var room_w = room_width div 2;
var room_h = room_height div 2;

// Calculate the scaling factors for width and height
var scale_w = room_w / sprite_width;
var scale_h = room_h / sprite_height;

// Choose the smaller scaling factor to maintain aspect ratio
var scale_uniform = min(scale_w, scale_h);

x = room_width / 2
y = 20 + ((sprite_height * scale_uniform) div 2)

