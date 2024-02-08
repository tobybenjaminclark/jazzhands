/// @description Insert description here
// You can write your code in this editor


cutscene = filepath_replace_last_element(beatmap_path, "cutscene.json");
show_message("Going to cutscene at " + cutscene);
cutscene_start(cutscene, room);
