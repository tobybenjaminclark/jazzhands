


if(alive == false)
{
	ticks_since_dead += 1;
	if(destroyed_particles == 0)
	{
		destroyed_particles = 1;

	}
	y = y - 2;
	if(x>850)
	{
		x = x + 3;
	}
	else
	{
		x = x - 3;
	}
	image_alpha = image_alpha - 0.009;
	image_xscale = image_xscale + 0.01;
	image_yscale = image_yscale + 0.01;
	if(ticks_since_dead > 2000)
	{
		instance_destroy(self);
	}

}
else
{
	y = y + 2;
}