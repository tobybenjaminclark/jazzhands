/// @description Initialize bullet points and timing variables

done = false;

// List of bullet points to display
bullet_points = [" Jazzhands uses the camera to recognise gestures.",
" This can be finnicky, so keep your hands up infront of the camera.",
" Try not to wiggle your hands around.",
" Keep your palms facing the webcam, like a double high five.",
" Keep your hands infront of your body, infront of your chest."];

// Initialize the index of the current bullet point
current_index = 0;

// Time between each bullet point (1.5 seconds in game frames)
display_interval = 1.5 * room_speed;

// Timer variable to track when to show the next bullet point
display_timer = display_interval;
