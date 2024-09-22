/// @description Insert description here
// You can write your code in this editor

draw_self(); // Draw the button's sprite

if(global.chosen_camera == name)
{
	colour = c_lime;
}
else
{
	colour = c_white;
}

draw_text_colour(x + sprite_width / 2, y + sprite_height / 2, name, colour, colour, colour, colour, 1); // Draw the button label