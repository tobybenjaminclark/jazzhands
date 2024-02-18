/// @description Handle Button Press
/// @author Toby Benjamin Clark
/// @date   12/01/2023

// Change state to speeding if not already.
if(state = state_spin_button.spinning)
	state = state_spin_button.speeding;
	
// If the state is speeding, change back to spinning & reset spin speed/scale.
else if(state = state_spin_button.speeding)
{
	state = state_spin_button.spinning;
	spin_speed = initial_spin_speed;
	image_xscale = initial_xscale;
	image_yscale = initial_yscale;
}
