/// @description Setup for Planetary Navigator
/// @author Toby Benjamin Clark
/// @date   12/01/2023

/* Initial Variables */
moving = true;
planetary_movement = directions.clockwise

/* Setting Planet Titles */
titles = 
[
	"Level 1",
	"Level 2",
	"Level 3",
	"Level 4",
	"Doomsphere",
]

/* Setting Planet Descriptions */
descriptions = 
[
	"Home of the Maoi",
	"Electrofunktor Habitat",
	"Rock & Metal",
	"Get Groovy",
	"...",
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

rock_levels = 
[
	AMPLIFORIA_1,
	AMPLIFORIA_2,
	AMPLIFORIA_3,
	AMPLIFORIA_4
]
rock_names = 
[
	"level 1",
	"level 2",
	"level 3",
	"level 4"
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

funk_levels = 
[
	FUNKOPOLOIS_1,
	FUNKOPOLOIS_2,
	FUNKOPOLOIS_3,
	FUNKOPOLOIS_4
]
funk_names = 
[
	"funk1",
	"funk2",
	"funk3",
	"funk4"
]

deathstar_levels = 
[
	DEATHSTAR_1,
	DEATHSTAR_2,
	DEATHSTAR_3,
	DEATHSTAR_4
]
deathstar_names = 
[
	"ds1",
	"ds2",
	"ds3",
	"ds4"
]

/*
 * Spawn Planets & Set Initial Variables
 * This isn't great, rewite at some point.
 */
angle_step = 0;
for (var i = 0; i < 3; i++;)
{
	global.current_story_navigator = self;
	var _levels = [];
	var _names = [];
	if(i == 0){
		_levels = harmonius_levels;
		_names = harmonius_names;
	}
	else if(i == 1){
		_levels = techno_levels;
		_names = techno_names;
	} else if(i == 2){
		_levels = rock_levels;
		_names = rock_names;
	} else if(i == 3){
		_levels = funk_levels;
		_names = funk_names;
	} else {
		_levels = deathstar_levels;
		_names = deathstar_names;
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
        image_index: (i mod 5) + 5,
        spin_speed: 0.5,
        title: titles[i],
		world: i,
        levels: _levels,
        names: _names,
        description: descriptions[i]
    });

    angle_step += 60;
}