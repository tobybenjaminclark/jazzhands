/// @description Insert description here
// You can write your code in this editor

alive = alive + 1;
x = x + 4;

// Dies after a bit...
if (alive > 5000)
{
	instance_destroy(self);
}