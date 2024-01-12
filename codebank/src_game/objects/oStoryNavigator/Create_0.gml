/// @description Insert description here
// You can write your code in this editor



moving = true;
planetary_movement = directions.counter_clockwise

angle_step = 0;
for(i = 0; i < 6; i++;)
{
	inst = instance_create_layer(x - 100, y - 100, "BackgroundInstances", oSpinningPlanet, {parent: self});
	inst.parent = self;
	inst.image_xscale = 0.1;
	inst.image_yscale = 0;
	inst.angle_step = angle_step;
	inst.y_max = (y + lengthdir_y(200, 270));
	inst.y_min = (y + lengthdir_y(200, 90));
	inst.y_mid = (inst.y_max + inst.y_min) / 2;
	angle_step += 60;
}