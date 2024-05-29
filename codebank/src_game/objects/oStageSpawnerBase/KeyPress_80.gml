/// @description Handles Pausing
/// @author Toby Benjamin Clark
/// @date   14/01/2023



if(paused == true)
{
	audio_play_sound(snd_record_scratch, 0, false, 1, 0, 1.4);
	unpaused_time = current_time;
	paused = false;	
    audio_resume_sound(sound);
}
else
{
	audio_play_sound(snd_record_scratch, 0, false);
	paused_time = current_time;
	paused = true;
    audio_pause_sound(sound);
}









