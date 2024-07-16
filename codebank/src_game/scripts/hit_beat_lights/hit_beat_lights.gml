// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hit_beat_lights(side, color)
{
	if(side == "LEFT"){
		with(oConsoleLight){
			if(type == 0){
				flash_timer = 4;
				flash_color = color;
			}
		}
	}
}