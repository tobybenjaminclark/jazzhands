/// @description Handles Starting Level
/// @author Toby Benjamin Clark
/// @date   14/01/2023


if(watched_cutscene && (!global.in_cutscene) && started == false){
	audio_stop_all();
	instance_create_layer(x, y, "InstancesNoGlow", oCountdown, {snd: sound});
	start_time = current_time + 3000;
	alt_start_time = start_time;
	started = true;
	
	/* Skip level (switch comment to enable...) */
	// end_time = start_time + 1000;
	
	end_time = start_time + (sound_len * 1000)
}







