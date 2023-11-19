/// @description Insert description here
// You can write your code in this editor

if(global.left_hand == "Thumb_Up" && global.right_hand == "Thumb_Up")
{
	if(screen == 0)
	{
		screen = 1;
		image_index = 1;
		audio_play_sound(sndSwitch, 1, false);
	}
	else if(screen == 2)
	{
		screen = 0;
		audio_play_sound(sndSwitch, 1, false);
		room_goto(rmSelectGame);
	}
}
else if(global.left_hand == "Open_Palm" && global.right_hand == "Open_Palm")
{
	if(screen == 1)
	{
		screen = 2;
		image_index = 2;
		audio_play_sound(sndSwitch, 1, false);
	}
}

