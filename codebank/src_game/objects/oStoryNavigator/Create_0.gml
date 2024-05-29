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
	"Home of the Maoi",
	"Electrofunktor Habitat",
	"Rock & Metal",
	"Beats & Peaks",
	"Shanty Town",
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

techno_levels = 
[
	ELECTRONOVA_1,
	ELECTRONOVA_2,
	ELECTRONOVA_3,
	ELECTRONOVA_4
]
techno_names = 
[
	"Techno1",
	"Techno2",
	"Techno3",
	"Techno4"
]

/*
 * Spawn Planets & Set Initial Variables
 * This isn't great, rewite at some point.
 */
angle_step = 0;
for (var i = 0; i < 5; i++;)
{
	global.current_story_navigator = self;
	var _levels = [];
	var _names = [];
	if(i == 0){
		_levels = harmonius_levels;
		_names = harmonius_names;
	}
	else{
		_levels = techno_levels;
		_names = techno_names;
	}
	
    var inst = instance_create_layer(x - 100, y - 100, "BackgroundInstances", oSpinningPlanet,
	{
        parent: global.current_story_navigator,
        image_xscale: 0.5,
        image_yscale: 0.5,
        angle_step: angle_step,
        y_max: (y + lengthdir_y(400, 270)),
        y_min: (y + lengthdir_y(400, 90)),
        y_mid: ( (y + lengthdir_y(400, 270)) + (y + lengthdir_y(400, 90))) / 2,
        image_index: i mod 5,
        spin_speed: 2,
        title: titles[i],
        levels: _levels,
        names: _names,
        description: descriptions[i]
    });

    angle_step += 50;
}