/// @description Insert description here
// You can write your code in this editor

/* Increment current step */
current_step++;

if(bg_alpha < 1) bg_alpha += 0.02;

/* increment display step (if u can) */
if(current_step % 50 == 0){
	display_step += 1;	
	switch(display_step){
		case 0:
			/* first */
			audio_play_sound(ping_hard, 0, false);
			break;
		case 1:
			/* total beats */
			audio_play_sound(ping_medium, 0, false);
			break;
		case 2:
			if(accuracy <= 0.5) audio_play_sound(sndNegative, 0, false);
			else audio_play_sound(sndPositive, 0, false);
			break;
		case 3:
			if(accuracy <= 0.5) audio_play_sound(sndNegative, 0, false);
			else audio_play_sound(sndPositive, 0, false);
			break;
		case 4:
			/* accuracy */
			audio_play_sound(ping_medium, 0, false);
			break
		case 5:
			/* post cutscene */
			if(accuracy >= pass_accuracy)
			{
				if(has_post_cutscene){
					instance_create_layer(room_width div 2 - 460, 700, "InstancesNoGlow", oSpinningDiscCutscene, {cutscene_path: post_cutscene_path, depth: -1000, image_xscale: 0.2, image_yscale: 0.2});
				}
				else if(!has_post_cutscene){
					instance_create_layer(room_width div 2 - 460, 700, "InstancesNoGlow", oSpinningDisc, {depth: -1000, image_xscale: 0.2, image_yscale: 0.2});
				}
			}
			else {
				instance_create_layer(room_width div 2 + 460, 700, "InstancesNoGlow", oSpinningDisc, {depth: -1000, image_xscale: 0.2, image_yscale: 0.2});
				instance_create_layer(room_width div 2 - 460, 700, "InstancesNoGlow", oSpinningDisc, {depth: -1000, image_xscale: 0.2, image_yscale: 0.2});
			}
			
			audio_play_sound(ping_medium, 0, false);
			break
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