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

// if((global.left_hand == "THUMB_DOWN" && global.right_hand == "THUMB_DOWN") and spawned_powerball == false){
if(keyboard_check_pressed(vk_space) and spawned_powerball == false){
	
	var _x = x;
	var _y = y + 300;
	var _created = false;
	/* Spawn powerball for each bouldered beat on the screen */
	with(oBoulderedBeat){
		if(x > 0 and x < room_width and y > 0 and y < room_width and boulder){
			var _self = self;
			_created = true;
			
			if(x > room_width div 2){ /* Spawn right */
				instance_create_layer(_x + 154, _y, "Instances", oPowerball, {target: _self});
			}	
			else{ /* Spawn left */
				instance_create_layer(_x - 154, _y, "Instances", oPowerball, {target: _self});
			}
			
		}
	}
	
	if(_created) {
		audio_play_sound(sndLaser, 0, false);
		hit_beat_lights("LEFT", c_aqua);
		hit_beat_lights("RIGHT", c_aqua);
	}
	
	spawned_powerball = true;
	
	/* comment to disable (breaks game when enabled) */
	spawned_powerball = false;
}
else{
	spawned_powerball = false;
}

// if(global.left_hand == "THUMB_UP" && global.right_hand == "THUMB_UP"){
if(keyboard_check_pressed(vk_down)){
	if(global.disco_mode == false){
		global.disco_mode = true;
		global.score_multiplier = 10;		
	}
}


/* End of song! */
if(current_time > end_time && !has_shown_end_screen){
	has_shown_end_screen = true;
	var _s = self;
	instance_create_layer(x, y, "InstancesNoGlow", oEndLevelScoreboard, {parent: _s});	
}