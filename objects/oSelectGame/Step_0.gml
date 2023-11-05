/// @description Insert description here
// You can write your code in this editor

if(global.left_hand == "Pointing_Up" && global.right_hand == "Pointing_Up")
{
	room_goto(rmSelectMode);
	global.SONG_SELECTED = "THRILLER";
}

if(global.left_hand == "Victory" && global.right_hand == "Victory")
{
	room_goto(rmSelectMode);
	global.SONG_SELECTED = "RASPUTIN";
}

if(global.left_hand == "Thumb_Up" && global.right_hand == "Thumb_Down")
{
	room_goto(rmSelectMode);
	global.SONG_SELECTED = "TETRIS";
}