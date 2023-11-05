/// @description Insert description here
// You can write your code in this editor
global.spawnrate = global.spawnrate + 1;

if(global.spawnrate > global.spawnmoment)
{	
	instance_create_layer(100, 500+random_range(-200,200), "BackgroundCharacters", oZombie);
	global.spawnrate = 0;
	global.spawnmoment -= 1;
	if(global.spawnmoment < 5)
	{
		global.spawnmoment = 5;
	}
}







