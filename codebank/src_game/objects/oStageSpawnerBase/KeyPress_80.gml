/// @description Insert description here
// You can write your code in this editor

if(paused == true)
{
	unpaused_time = current_time;
	paused = false;	
    audio_resume_sound(sound);
}
else
{
	paused_time = current_time;
	paused = true;
    audio_pause_sound(sound);
}









