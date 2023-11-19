/// @description Insert description here
// You can write your code in this editor

// obj_object Step Event
x += lengthdir_x(speed, direction);

// Check if the object is out of bounds
if (x > room_width) {
    // If it's out of bounds, reset its position to the starting point
    x = 0;
}