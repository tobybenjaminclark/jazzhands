/// @description State-Based Control Architecture
/// @author Toby Benjamin Clark
/// @date   12/01/2023

/* Handle CV Button Trigger */
// Change state to speeding if not already.
if (global.left_hand == left_trigger			/* <-- Left Hand Matches */
	&& global.right_hand == right_trigger	    /* <-- Right Hand Matches */
	&& state == state_spin_button.spinning)		/* <-- Not already triggered */
{
	state = state_spin_button.speeding;
}

// Switch dependent on button state.
switch(state)
{
	// Spin State : Keep spinning.
	case state_spin_button.spinning:
		image_angle +=  spin_speed;
		break;
		
	// Speeding State: Increase speed + Scale
	case state_spin_button.speeding:
		
		if(!have_queued_room && spin_speed > trigger_room_start_speed)
		{
			have_queued_room = true;
			global.queued_room = next_room;
		}
	
		spin_speed += speed_addition;
		image_xscale *= scale_modifier;
		image_yscale *= scale_modifier;
		
		// Check if maximum speed has been reached.
		if(spin_speed >= initial_spin_speed * speed_maximum_amp) 
		{	
			spin_speed = 0;
			state = state_spin_button.stopped;
		}
		image_angle +=  spin_speed;
		break;
	
	// Stopped State : Switch to next room.
	case state_spin_button.stopped:
		break;
}


/* Hover logic */
if(hover)
{
	image_xscale += 0.02;
	image_yscale += 0.02;
}
else
{
	image_xscale -= 0.02;
	image_yscale -= 0.02;
}

if(image_xscale < initial_xscale) image_xscale = initial_xscale
if(image_yscale < initial_yscale) image_yscale = initial_yscale
if(image_xscale > hover_xscale) image_xscale = hover_xscale
if(image_yscale > hover_yscale) image_yscale = hover_yscale