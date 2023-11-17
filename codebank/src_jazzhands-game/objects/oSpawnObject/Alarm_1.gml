/// @description Insert description here
// You can write your code in this editor

// Play sound!
if(global.SONG_SELECTED == "THRILLER")
{
	audio_play_sound(sndThriller, 1, false);
}
else if(global.SONG_SELECTED == "RASPUTIN")
{
	audio_play_sound(sndRasputin, 1, false);
}
else if(global.SONG_SELECTED == "TETRIS")
{
	audio_play_sound(sndTetris, 1, false);
}

