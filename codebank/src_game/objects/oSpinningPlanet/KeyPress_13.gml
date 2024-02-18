/// @description Insert description here
// You can write your code in this editor

if(is_stopper)
{
	// Calculate Selected Level
	var index = -1;
	for (var angle = start_angle; angle < start_angle + 91; angle += 30)
	{
		index++;
		if(angle == 0) break;
	}
	global.current_beatmap = levels[index];

	
	global.queued_room = rmstage_harmonica;
}











