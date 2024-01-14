/// @description Handles Beat Behaviour
/// @author Toby Benjamin Clark
/// @date   14/01/2023

// Resume game if currently paused
if (paused) {
    if (!parent.paused) {
        paused = false;
        target_time += (parent.unpaused_time - parent.paused_time);
    }
}

// Start the game timer
if (parent.start_time != 0 && !set) {
    /* Start! */
    set = true;
    start_time = parent.start_time;
    target_time = start_time + time;
    moving = true;
}



// Pause if parent is paused
if (parent.paused) {
    paused = true;
}

// Update y position if moving and not paused
if (moving && !paused) {
    y = (parent.kill_line - (sprite_height / 2)) - ((target_time - current_time) / movement_factor);
    if (y >= (parent.kill_line) || current_time >= target_time) {
        moving = false;
    }
}







