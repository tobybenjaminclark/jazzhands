/// @description Insert description here
// You can write your code in this editor

intro_delay--;
if(intro_delay == 0){
	instance_create_layer(x, y, "Instances", oSpinner);
	cutscene = filepath_replace_last_element(beatmap_path, "cutscene.json");
	cutscene_start(cutscene, room);
	global.in_cutscene = true;
	watched_cutscene = true;	
}