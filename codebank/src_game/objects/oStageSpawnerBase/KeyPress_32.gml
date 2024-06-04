/// @description Handles Starting Level
/// @author Toby Benjamin Clark
/// @date   14/01/2023


if(watched_cutscene && (!global.in_cutscene) && started == false){
	audio_stop_all();
	instance_create_layer(x, y, "Instances", oCountdown, {snd: sound});
	start_time = current_time + 3000;
	started = true;
}







