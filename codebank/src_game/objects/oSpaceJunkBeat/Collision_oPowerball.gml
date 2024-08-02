/// @description Insert description here
// You can write your code in this editor

if(boulder == true){
	audio_play_sound(snd_rock_destroy, 1, false);
	emit_junk(x, y);
	boulder = false;
}

boulder = false;
instance_destroy(other);


