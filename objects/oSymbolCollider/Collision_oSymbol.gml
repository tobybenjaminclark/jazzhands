/// @description Insert description here
// You can write your code in this editor
if(current_state == other.stype)
{
	global.points = global.points + 1;
	audio_play_sound(sndBlockHit, 2, false);
	instance_destroy(other);
}