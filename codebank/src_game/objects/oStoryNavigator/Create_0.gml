/// @description Setup for Planetary Navigator
/// @author Toby Benjamin Clark
/// @date   12/01/2023

/* Initial Variables */
moving = true;
planetary_movement = directions.counter_clockwise

/* Setting Planet Titles */
titles = 
[
	"Symphonya",
	"Electronova",
	"Ampliforia",
	"Dropopolis",
	"Maritune",
]

/* Setting Planet Descriptions */
descriptions = 
[
	"Planet of harmony, peace and symphony.",
	"Planet of electronic & techno vibes.",
	"Planet of harder music.",
	"Planet of skrillex.",
	"Planet o' the shantys.",
]

harmonius_levels = 
[
	HARMONIUS_1,
	HARMONIUS_2,
	HARMONIUS_3,
	HARMONIUS_4
]
harmonius_names = 
[
	"Bazaar",
	"Book",
	"Cord",
	"Level"
]

/*
 * Spawn Planets & Set Initial Variables
 * This isn't great, rewite at some point.
 */
angle_step = 0;
for(i = 0; i < 5; i++;)
{
	inst = instance_create_layer(x - 100, y - 100, "BackgroundInstances", oSpinningPlanet, {parent: self});
	inst.parent = self;
	inst.image_xscale = 0.5;
	inst.image_yscale = 0.5;
	inst.angle_step = angle_step;
	inst.y_max = (y + lengthdir_y(400, 270));
	inst.y_min = (y + lengthdir_y(400, 90));
	inst.y_mid = (inst.y_max + inst.y_min) / 2;
	inst.image_index = i mod 5;
	inst.spin_speed = 0.3;
	inst.title = titles[i];
	inst.levels = harmonius_levels;
	inst.names = harmonius_names;
	inst.description = descriptions[i];
	angle_step += 50;
}