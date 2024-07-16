// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hit_beat_lights(side, color)
{
	with(oConsoleLight){
		if(type == -1 && side == "LEFT"){
			flash_timer = 10;
			flash_color = color;
		}
		else if(type == 1 && side == "RIGHT"){
			flash_timer = 10;
			flash_color = color;
		}
		if(type == 0){
			flash_timer = 6;
			flash_color = color;		
		}
	}
	
	with(oConsoleLightWeird1){
		if(type == -1 && side == "LEFT"){
			flash_timer = 10;
			flash_color = color;
		}
		else if(type == 1 && side == "RIGHT"){
			flash_timer = 10;
			flash_color = color;
		}
		if(type == 0){
			flash_timer = 6;
			flash_color = color;		
		}
	}
}