/// @description Handles Beat Behaviour
/// @author Toby Benjamin Clark
/// @date   14/01/2023

/* Particles */
// Define variables for smooth rotation
var target_angle = 0;
var easing = 0.45; // Adjust the easing value for desired smoothness

if (rotation_direction == 1) {
    target_angle = 10;
} else {
    target_angle = -10;
}

// Smoothly adjust the image_angle towards the target_angle
var delta_angle = target_angle - image_angle;
image_angle += delta_angle * easing;

// Check if rotation direction needs to be changed
if (rotation_direction == 1 && image_angle >= 10) {
    rotation_direction = 0;
} else if (rotation_direction == 0 && image_angle <= -10) {
    rotation_direction = 1;
}

// Handle respositioning
if(y + sprite_height > 0 && has_horizontal_shifted == false){
	if (side == "LEFT"){
		x = (room_width div 2) - 540;
		sx = x;
	}
	else if (side == "RIGHT"){
		x = (room_width div 2) + 540;
		sx = x;
	}
	has_horizontal_shifted = true;
}


/* Game Pause Logic */
if (parent.paused) paused = true;
if (paused && !parent.paused){
        paused = false;
        target_time += (parent.unpaused_time - parent.paused_time);
}


/* Game Start Logic */
if (parent.start_time != 0 && !set){
    set = true;
    start_time = parent.start_time;
    target_time = start_time + time;
    moving = true;
}


/* Move Symbol if moving & not paused */
if (moving && !paused && !dead)
{
	/* Rotate constantly */
	image_angle += 1;
	
	/* Emit movement particles */
	if(random(1) > 0.8 && y >= -32) part_particles_create(_ps2, x, y, _ptype12, 1);
	
	/* Horizontal Moving Logic */
	// sx = starting x
	// tx = final x
	// Define the time at which the symbol should start moving
	var activation_time = target_time - 5000;  // Example: start moving when 90% of target_time is reached

	// Ensure current_time is within the bounds of 0 to target_time
	var clamped_time = clamp(current_time, 0, target_time);

	// Calculate the interpolation factor (a value between 0 and 1), starting from activation_time
	var t = 0;
	if (clamped_time >= activation_time) {
	    t = (clamped_time - activation_time) / (target_time - activation_time);
	}

	// Interpolate between sx and tx
	x = lerp(sx, tx, t);
	
    y = (parent.kill_line - (sprite_height / 2)) - ((target_time - current_time) / movement_factor);
	
	/* Symbol Death Transition */
    if (y >= (parent.kill_line) || current_time >= target_time)
	{
		if((side == "LEFT" && global.left_hand == symbol) || (side == "RIGHT" && global.right_hand == symbol))
		{
			/* Hit bad beat */
			part_particles_create(_ps, x, y, _ptype1, 25);
			ds_list_clear(parent.combo_list);
			image_blend = make_color_rgb(255, 100, 100);
			hit_beat_lights(side, c_red);
		}
		else
		{
			/* Didn't hit (good) */
			global.hit_beats += 1;
			part_particles_create(_ps, x, y, _ptype2, 25);
			parent.level_score += (100 * global.score_multiplier);
			ds_list_add(parent.combo_list, COMBO_ANTIBEAT);
			image_blend = make_color_rgb(100, 255, 100);
			hit_beat_lights(side, c_lime);
		}
		
		dead = true;
	}
	/* TODO: Score Logic */
}



/* Symbol Death Logic */
if(dead)
{
	if(image_xscale > 0.3){image_xscale -= 0.005;}
	if(image_yscale > 0.3){image_yscale -= 0.005;}
	if(image_alpha > 0) image_alpha -= 0.001;
	
	moving = false;
	y = y - 1;
	if(x>room_width/2) x += 1;
	else x -= 1;
	if((x < 0 || x > room_width) && (y < 0 || y > room_height))
	{
		instance_destroy(self);
	}
}





