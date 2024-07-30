/// @description Insert description here
// You can write your code in this editor

/* Increment alphas */
if(an1 < 1 && display_step >= 0) an1 = an1 + alpha_increase;
if(a0 < 1 && display_step >= 1) a0 = a0 + alpha_increase;
if(a1 < 1 && display_step >= 2) a1 = a1 + alpha_increase;
if(a2 < 1 && display_step >= 3) a2 = a2 + alpha_increase;
if(a3 < 1 && display_step >= 4) a3 = a3 + alpha_increase;
if(a4 < 1 && display_step >= 5) a4 = a4 + alpha_increase;
if(a5 < 1 && display_step >= 6) a5 = a5 + alpha_increase;

/* Increment current step */
current_step++;

if(bg_alpha < 1) {
	bg_alpha += 0.02;
	var _a = bg_alpha;
	with(oLabel){image_alpha = 1 - _a}
	with(oSpinningDisc){image_alpha = 1 - _a}
}
else if(bg_alpha == 1){
	bg_alpha += 1;
	with(oLabel){instance_destroy();}
	with(oSpinningDisc){instance_destroy();}
}

/* increment display step (if u can) */
if(current_step % 50 == 0){
	switch(display_step){
		case -1:
			display_step += 1;
			break;
		case 0:
			/* first */
			display_step += 1;	
			audio_play_sound(ping_hard, 0, false);
			break;
		case 1:
			/* total beats */
			display_step += 1;	
			audio_play_sound(ping_medium, 0, false);
			break;
		case 2:
			display_step += 1;	
			if(accuracy <= 0.5) audio_play_sound(sndNegative, 0, false);
			else audio_play_sound(sndPositive, 0, false);
			break;
		case 3:
			display_step += 1;	
			if(accuracy <= 0.5) audio_play_sound(sndNegative, 0, false);
			else audio_play_sound(sndPositive, 0, false);
			break;
			
		case 4:
			/* accuracy (only progress if bar is full) */
			if(iaccuracy_display >= iaccuracy){
				display_step += 1;
				audio_play_sound(ping_medium, 0, false);
			}
			break;
			
		case 5:
			display_step += 1;
			
			/* post cutscene */
			if(accuracy >= pass_accuracy)
			{
				/* Update save file (success!) */
				var _s = json_parse_from_filepath("userbank/" + "PLAYER.json")
				if (_s.statistics.player_level <= global.numerical_level){
					_s.statistics.player_level = global.numerical_level + 1;
					json_save(_s, "userbank/PLAYER.json");
				}
				
				if(has_post_cutscene){
					instance_create_layer(room_width div 2 - 460, 700, "InstancesNoGlow", oSpinningDiscCutscene, {cutscene_path: post_cutscene_path, depth: -1000, image_xscale: 0.2, image_yscale: 0.2, initial_alpha: 0});
				}
				else if(!has_post_cutscene){
					instance_create_layer(room_width div 2 - 460, 700, "InstancesNoGlow", oSpinningDisc, {depth: -1000, image_xscale: 0.2, image_yscale: 0.2, initial_alpha: 0});
				}
			}
			else {
				instance_create_layer(room_width div 2 + 460, 700, "InstancesNoGlow", oSpinningDisc, {next_room: rmstage_harmonica, depth: -1000, image_xscale: 0.2, image_yscale: 0.2, initial_alpha: 0});
				instance_create_layer(room_width div 2 - 460, 700, "InstancesNoGlow", oSpinningDisc, {depth: -1000, image_xscale: 0.2, image_yscale: 0.2, initial_alpha: 0});
			}
			
			audio_play_sound(ping_medium, 0, false);
			break;
		default:
			break;
	}
}

/* iAccuracy (integer accuracy) */
if(display_step >= 4){
	if(iaccuracy_display < iaccuracy && current_step % 3 == 0){
		iaccuracy_display += 1;
		_p = 1;
		if(iaccuracy_display > pass_accuracy) _p = 2;
		audio_play_sound(snd_metronome, 0, false, 0.5, 0, _p);
	}
	else if(iaccuracy_display >= iaccuracy && !has_played_end_accuracy_seq){
		has_played_end_accuracy_seq = true;
		if(iaccuracy >= pass_accuracy){
			audio_play_sound(sndWinLevel, 0, false);
		}
		else audio_play_sound(sndLoseLevel, 0, false);
	}
}