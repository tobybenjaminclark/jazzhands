/// @description Insert description here
// You can write your code in this editor

if(!is_stopper)
{
	if(text_alpha > 0)
    text_alpha -= 0.05;
}
else if(is_stopper)
{
	if(text_alpha < 1)
    text_alpha += 0.05;
}

if(parent.moving)
{
	is_stopper = false;
	if(parent.planetary_movement == directions.clockwise)
	{
		angle_step -= 0.4;
	}
	else if(parent.planetary_movement == directions.counter_clockwise)
	{
		angle_step += 0.4;
	}
	
	x = parent.x + lengthdir_x(500, angle_step);
	y = (parent.y + lengthdir_y(200, angle_step));
	image_yscale = (-0.10 + 0.4 * (logistic_curve(y_min, y_max, y)))
	image_xscale = (-0.10 + 0.4 * (logistic_curve(y_min, y_max, y)))
	
	if(y > y_mid)
	{
		self.layer = layer_get_id("ForegroundInstances");
	}
	else if(y <= y_mid)
	{
		self.layer = layer_get_id("BackgroundInstances");
	}
	
	if(angle_step == 360)
		angle_step = 0;
	if(round(y) == y_max && ignore == false)
	{
		parent.moving = false;
		is_stopper = true;
		ignore = true;
	}
	if(ignore)
	{
		if(round(y) != y_max)
		{
			ignore = false;
		}
	}
}



// Inherit the parent event
event_inherited();

