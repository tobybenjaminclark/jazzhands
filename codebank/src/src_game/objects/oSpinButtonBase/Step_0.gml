/// @description State-Based Control Architecture
/// @author Toby Benjamin Clark
/// @date   12/01/2023

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

