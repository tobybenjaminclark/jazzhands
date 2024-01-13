/// @description Insert description here
// You can write your code in this editor



moving = true;
planetary_movement = directions.counter_clockwise

titles = 
[
	"Symphonya",
	"Electronova",
	"Ampliforia",
	"Dropopolis",
	"Maritune",
]

descriptions = 
[
	"Planet of harmony, peace and symphony.",
	"Planet of electronic & techno vibes.",
	"Planet of harder music.",
	"Planet of skrillex.",
	"Planet o' the shantys.",
]

angle_step = 0;
for(i = 0; i < 5; i++;)
{
	inst = instance_create_layer(x - 100, y - 100, "BackgroundInstances", oSpinningPlanet, {parent: self});
	inst.parent = self;
	inst.image_xscale = 0.1;
	inst.image_yscale = 0;
	inst.angle_step = angle_step;
	inst.y_max = (y + lengthdir_y(200, 270));
	inst.y_min = (y + lengthdir_y(200, 90));
	inst.y_mid = (inst.y_max + inst.y_min) / 2;
	inst.image_index = i mod 5;
	inst.spin_speed = 0.5;
	inst.title = titles[i];
	inst.description = descriptions[i];
	angle_step += 50;
}