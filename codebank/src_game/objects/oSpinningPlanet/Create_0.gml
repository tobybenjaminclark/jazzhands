/// @description Subclass Event for oSpinning Planet
// You can write your code in this editor

enum directions
{
	counter_clockwise,
	clockwise,
}

have_queued_room = false;
dir = "NONE";

// Ignore Y Max
ignore = false;
is_stopper = false;
text_alpha = 0.0;

start_angle = 0;

// Initial Hover (set to false)
hover = false;

// Setting the initial state & making note of the initial spin speed.
initial_spin_speed = spin_speed;
state = state_spin_button.spinning;

// Setting initial object scales.
initial_xscale = image_xscale;
initial_yscale = image_yscale;