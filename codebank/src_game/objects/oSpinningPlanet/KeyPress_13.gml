/// @description Go to level
/// @author Toby Benjamin Clark
/// @date   18/02/24

if(is_stopper)
{
	// Calculate Selected Level
	index = 0
	
	/* Can play! */
	audio_play_sound(snd_ping_low, 0, false);
	global.current_beatmap = levels[index];
	global.numerical_level = 4 * (world) + index + 1
	global.current_level = "W" + string(world) + "-L" + string(index + 1);
	
	global.queued_room = rmstage_harmonica;
}











