/// @description Insert description here
// You can write your code in this editor

if(global.left_hand == "Open_Palm" && global.right_hand == "Closed_Fist")
{
	global.DIFFICULTY = 1;
	global.MODE_SELECTED = "JazzHands";
	audio_play_sound(sndSwitch, 1, false);
	global.SONG_SELECTED = "THRILLER";
	room_goto(rmGame);
	
}

if(global.left_hand == "Victory" && global.right_hand == "Victory")
{
	global.DIFFICULTY = 1;
	global.MODE_SELECTED = "JazzHands";
	audio_play_sound(sndSwitch, 1, false);
	global.SONG_SELECTED = "RASPUTIN";
	room_goto(rmGame);
	
}

if(global.left_hand == "Thumb_Up" && global.right_hand == "Thumb_Down")
{
	global.DIFFICULTY = 1;
	global.MODE_SELECTED = "JazzHands";
	audio_play_sound(sndSwitch, 1, false);
	global.SONG_SELECTED = "TETRIS";
	room_goto(rmGame);
	
}
if(global.left_hand == "Thumb_Down" && global.right_hand == "Thumb_Down")
{
	global.DIFFICULTY = 1;
	global.MODE_SELECTED = "JazzHands";
	audio_play_sound(sndDeath, 1, false);
	room_goto(rmSceensaver);
	
}