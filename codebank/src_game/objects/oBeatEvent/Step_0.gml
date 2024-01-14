/// @description Insert description here
// You can write your code in this editor

/* check started */


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

// Set x position based on side
if (side == "LEFT") {
    x = sx - 100;
} else if (side == "RIGHT") {
    x = sx + 100;
}

// Pause if parent is paused
if (parent.paused) {
    paused = true;
}

// Update y position if moving and not paused
if (moving && !paused) {
    y = (parent.kill_line) - ((target_time - current_time) / movement_factor);
    if (y >= (parent.kill_line) || current_time >= target_time) {
        moving = false;
    }
}







