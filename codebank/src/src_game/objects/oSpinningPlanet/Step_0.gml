/// @description Handle Planetary Movement
/// @author Toby Benjamin Clark
/// @date   12/01/2023

/* If this planet hasn't stopped the movment, hide the text */
if(!is_stopper && text_alpha > 0) text_alpha -= 0.05


/* If this planet has stopped the movement, show the text */
else if(is_stopper && text_alpha < 1) text_alpha += 0.05;


/* If the planetary system is moving */
if(parent.moving)
{
	/* If the planets are moving, then the planets aren't stopped. */
	is_stopper = false;
	
	/* Increment/Deincrement `angle_step` dependent on direction. Normalise to 360 */
	if(parent.planetary_movement == directions.clockwise) angle_step -= 0.4;
	else if(parent.planetary_movement == directions.counter_clockwise) angle_step += 0.4;
	if(angle_step == 360) angle_step = 0;
	
	/* Update position using 2D vector from parent position */
	x = parent.x + lengthdir_x(500, angle_step);
	y = (parent.y + lengthdir_y(200, angle_step));
	
	/* Update image scale depenent on depth (enhances background/foreground) */
	image_yscale = (-0.10 + 0.4 * (logistic_curve(y_min, y_max, y)))
	image_xscale = (-0.10 + 0.4 * (logistic_curve(y_min, y_max, y)))
	
	/* Change layer dependent on position, so that central object occludes background planets */
	if(y > y_mid) self.layer = layer_get_id("ForegroundInstances");
	else if(y <= y_mid) self.layer = layer_get_id("BackgroundInstances");

	
	/* Logic to stop planet, based on rounding current y, and checking if equal to y_max */
	if(round(y) == y_max && ignore == false)
	{
		parent.moving = false;
		is_stopper = true;
		ignore = true;
	}
	
	/* Fixes weird bug where planet stops every tick, as Y still rounded to max(y) */
	if(ignore)
	{
		if(round(y) != y_max) ignore = false;
	}
}


// Inherit the parent event
event_inherited();

