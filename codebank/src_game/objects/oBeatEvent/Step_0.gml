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
    start_time = parent.start_time;
    target_time = start_time + time;
    moving = true;
}


/* Move Symbol if moving & not paused */
if (moving && !paused)
{
	
	/* Moving Logic */
    y = (parent.kill_line - (sprite_height / 2)) - ((target_time - current_time) / movement_factor);
	
	/* Symbol Death Transition */
    if (y >= (parent.kill_line) || current_time >= target_time) dead = true;
	
	/* TODO: Score Logic */
}



/* Symbol Death Logic */
if(dead)
{
	image_blend = make_color_rgb(255, 100, 100);
	
	moving = false;
	y = y - 1;
	if(x>room_width/2) x += 1;
	else x -= 1;
	if((x<0 || x>room_width) && (y<0 || y>room_height))
	{
		instance_destroy(self);
	}
}





