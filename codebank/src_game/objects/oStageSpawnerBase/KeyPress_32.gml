/// @description Handles Starting Level
/// @author Toby Benjamin Clark
/// @date   14/01/2023

if(!watched_cutscene){
	cutscene = filepath_replace_last_element(beatmap_path, "cutscene.json");
	show_message("Going to cutscene at " + cutscene);
	cutscene_start(cutscene, room);
	global.in_cutscene = true;
	watched_cutscene = true;
}
if(watched_cutscene && (!global.in_cutscene)){
	audio_stop_all();
	audio_play_sound(sound, 1, false);
	start_time = current_time;
}







