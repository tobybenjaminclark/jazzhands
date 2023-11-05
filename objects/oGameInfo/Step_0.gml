/// @description Insert description here
// You can write your code in this editor
global.spawnrate = global.spawnrate + 1;

if(global.spawnrate > global.spawnmoment)
{	
	instance_create_layer(100, 585+random_range(0,400), "BackgroundCharacters", oZombie);
	global.spawnrate = 0;
	global.spawnmoment -= 1;
	if(global.spawnmoment < 15)
	{
		global.spawnmoment = 15;
	}
}







