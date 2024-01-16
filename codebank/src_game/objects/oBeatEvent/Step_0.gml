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


// Update y position if moving and not paused
if (moving && !paused)
{
	/* Moving Logic */
    y = (parent.kill_line - (sprite_height / 2)) - ((target_time - current_time) / movement_factor);
	
	/* Symbol Death Logic */
    if (y >= (parent.kill_line) || current_time >= target_time) moving = false;
}







