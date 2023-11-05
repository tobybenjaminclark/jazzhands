/// @description Insert description here
// You can write your code in this editor
global.spawnrate = global.spawnrate + 1;

if(global.spawnrate > global.spawnmoment)
{	
	if(global.SONG_SELECTED == "THRILLER")
	{
		instance_create_layer(100, 585+random_range(0,400), "BackgroundCharacters", oZombie);
	}
	else if(global.SONG_SELECTED == "RASPUTIN")
	{
		instance_create_layer(100, 585+random_range(0,400), "BackgroundCharacters", oRussianDoll);
		instance_create_layer(100 - random_range(100,200), 585+random_range(0,400), "BackgroundCharacters", oRussianSoldier);
	}
	
	
	global.spawnrate = 0;
	global.spawnmoment -= 1;
	if(global.spawnmoment < 15)
	{
		global.spawnmoment = 15;
	}
}







