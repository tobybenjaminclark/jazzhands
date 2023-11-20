/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y, objNavigatorPlayer) )
{
	state = 1;
}
else
{
	state = 0;
}

if(state = 1 && image_index != 24)
{
	image_index += 1;
}
else if(image_index > 0)
{
	image_index -= 1;
}



