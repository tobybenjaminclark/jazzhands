/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y, objNavigatorPlayer) )
{
	if(!audio_playing)
	{
		audio_play_sound(song, 1, false);
		audio_playing = true;
	}
	state = 1;
}
else
{
	audio_playing = false;
    audio_stop_sound(song);
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



