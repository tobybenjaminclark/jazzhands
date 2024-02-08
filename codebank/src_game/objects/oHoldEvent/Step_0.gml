/// @description Handles Beat Behaviour
/// @author Toby Benjamin Clark
/// @date   14/01/2023

/* Game Pause Logic */
if (parent.paused) paused = true;
if (paused && !parent.paused)
{
        paused = false;
        target_time += (parent.unpaused_time - parent.paused_time);
}


/* Game Start Logic */
if (parent.start_time != 0 && !set)
{
    set = true;
    pstart_time = parent.start_time;
    target_time = pstart_time + start_time;
    moving = true;
}


/* Move Symbol if moving & not paused */
if (moving && !paused && !dead)
{
	/* Moving Logic */
    y = (parent.kill_line - (sprite_height / 2)) - ((target_time - current_time) / movement_factor);
	
	if((y + sprite_width) - ((end_time - start_time) / movement_factor) <= parent.kill_line && (y + sprite_width) >= parent.kill_line)
	{
		if((side == "LEFT" && global.left_hand == symbol) || (side == "RIGHT" && global.right_hand == symbol))
		{
			if(missed == false) colliding = true;
			else colliding = false;
		}
		else
		{
			colliding = false;
			missed = true;
		}
	}
	else
	{
		colliding = false;	
	}

}


/* Symbol Death Transition */
if ((y + sprite_width) - ((end_time - start_time) / movement_factor) >= parent.kill_line)
{	
	if(!missed)
	{
		image_blend = make_color_rgb(100, 255, 100);
		parent.level_score += 100;
	}
	else if(missed) image_blend = make_color_rgb(255, 100, 100);
	dead = true;
}


/* Symbol Death Logic */
if(dead)
{
	moving = false;
	y = y - 1;
	if(x>room_width/2) x += 1;
	else x -= 1;
	if((x<0 || x>room_width) && (y<0 || y>room_height))
	{
		instance_destroy(self);
	}
}





