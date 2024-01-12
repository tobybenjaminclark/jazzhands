/// @description Defines State Enum & Initial Values
/// @author Toby Benjamin Clark
/// @date   12/01/2023

/**
 * Enumeration for States (within spin button).
 *
 * Spinning		:	The button is spinning (yet to be triggered).
 * Slowing		:	The button has been pressed, and is speeding up.
 * Stopped		:	The button has reached it's maximum velocity, the next room has been triggered.
*/
enum state_spin_button
{
	spinning,
	speeding,
	stopped
}

// Setting the initial state & making note of the initial spin speed.
initial_spin_speed = spin_speed;
state = state_spin_button.spinning;

// Setting initial object scales.
initial_xscale = image_xscale;
initial_yscale = image_yscale;

// For Room Transition
have_queued_room = false;
trigger_room_start_speed = initial_spin_speed + (((initial_spin_speed * speed_maximum_amp) - initial_spin_speed) * 0.35);

