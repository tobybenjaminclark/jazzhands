/// @description Create
/// @author Toby Benjamin Clark
/// @date   18/02/24

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

level_objects = []
for(var level_index = 0; level_index < array_length(levels); level_index++)
{
	json = json_parse_from_filepath(levels[level_index]);
	if(validate_beatmap(json, levels[level_index]))level_objects[level_index] = json;
	else show_message("Failed to load story level")
}

