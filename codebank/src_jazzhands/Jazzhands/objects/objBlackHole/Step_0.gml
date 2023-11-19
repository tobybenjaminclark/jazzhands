/// @description Insert description here
// You can write your code in this editor

// obj_object Step Event
x += 0.25;

// Check if the object is out of bounds
if (x > room_width) {
    // If it's out of bounds, reset its position to the starting point
    x = 0;
}

current_step += 0.01;

image_angle += sin(current_step);

