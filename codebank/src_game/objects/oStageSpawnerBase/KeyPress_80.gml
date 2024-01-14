/// @description Handles Pausing
/// @author Toby Benjamin Clark
/// @date   14/01/2023

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









