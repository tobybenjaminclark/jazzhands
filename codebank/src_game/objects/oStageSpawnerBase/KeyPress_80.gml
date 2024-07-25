/// @description Handles Pausing
/// @author Toby Benjamin Clark
/// @date   14/01/2023


if(paused == true){
	audio_play_sound(snd_record_scratch, 0, false, 1, 0, 1.4);
	unpaused_time = current_time;
	alt_start_time += (unpaused_time - paused_time);
	end_time += (unpaused_time - paused_time) - 999999999999999;
	paused = false;	
    audio_resume_sound(sound);
}


else{
	audio_play_sound(snd_record_scratch, 0, false);
	paused_time = current_time;
	end_time += 999999999999999;
	paused = true;
    audio_pause_sound(sound);
}


