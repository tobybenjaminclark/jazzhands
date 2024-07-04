/// @description Insert description here
// You can write your code in this editor

spd = 5
target = instance_nearest(x, y, oBoulderedBeat)
if(target.x < 0 || target.y < 0 || target.boulder == false){
	instance_destroy(self);	
}