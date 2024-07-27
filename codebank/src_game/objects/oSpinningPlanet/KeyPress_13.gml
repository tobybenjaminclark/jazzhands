/// @description Go to level
/// @author Toby Benjamin Clark
/// @date   18/02/24

if(is_stopper)
{
	audio_play_sound(snd_ping_low, 0, false);
	// Calculate Selected Level
	var index = -1;
	for (var angle = start_angle; angle < start_angle + 91; angle += 30)
	{
		index++;
		if(angle == 0) break;
	}
	global.current_beatmap = levels[index];
	global.current_level = "W" + string(world) + "-L" + string(index);
	
	global.queued_room = rmstage_harmonica;
}











