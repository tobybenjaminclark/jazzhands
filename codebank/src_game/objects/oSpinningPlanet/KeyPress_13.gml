/// @description Go to level
/// @author Toby Benjamin Clark
/// @date   18/02/24

if(is_stopper)
{
	// Calculate Selected Level
	var index = -1;
	for (var angle = start_angle; angle < start_angle + 91; angle += 30)
	{
		index++;
		if(angle == 0) break;
	}
	
	/* Can the player play this level? */
	if(player_level < (4 * (world) + index + 1)){
		/* Cannot play! */
		audio_play_sound(snd_rock_destroy, 0, false);
		return;
	}
	else{
		/* Can play! */
		audio_play_sound(snd_ping_low, 0, false);
		global.current_beatmap = levels[index];
		global.numerical_level = 4 * (world) + index + 1
		global.current_level = "W" + string(world) + "-L" + string(index + 1);
	
		global.queued_room = rmstage_harmonica;
	}
}











