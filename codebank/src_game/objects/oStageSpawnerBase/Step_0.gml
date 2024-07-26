/// @description Insert description here
// You can write your code in this editor

intro_delay--;
if(intro_delay == 0){
	instance_create_layer(x, y, "Instances", oSpinner);
	cutscene = filepath_replace_last_element(beatmap_path, "cutscene.json");
	
	if file_exists(cutscene){
		cutscene_start(cutscene, room);
		global.in_cutscene = true;
		watched_cutscene = true;
	}
	else{
		global.in_cutscene = false;
		watched_cutscene = true;
	}
		
}

if(global.left_hand == "THUMB_DOWN" && global.right_hand == "THUMB_DOWN" and spawned_powerball == false){
	instance_create_layer(x, y, "Instances", oPowerball);
	spawned_powerball = true;	
}
else{
	spawned_powerball = false;	
}

if(global.left_hand == "THUMB_UP" && global.right_hand == "THUMB_UP"){
	global.score_multiplier = 10;	
}


/* End of song! */
if(current_time > end_time && !has_shown_end_screen){
	has_shown_end_screen = true;
	var _s = self;
	instance_create_layer(x, y, "InstancesNoGlow", oEndLevelScoreboard, {parent: _s});	
}