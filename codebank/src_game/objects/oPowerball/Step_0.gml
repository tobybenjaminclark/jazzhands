
/// @description Insert description here
// You can write your code in this editor

part_system_position(_ps, x, y);
image_angle += 8;

var _is_paused = false;
with(oStageSpawnerBase){
	_is_paused = paused;
}

if(!_is_paused){
	move_towards_point(target.x, target.y, spd);
} else {
	move_towards_point(target.x, target.y, 0);
}
