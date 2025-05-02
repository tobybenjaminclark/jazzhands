/// @description Initialize bullet points and timing variables

done = false;

// List of bullet points to display
bullet_points = [" Hand Symbols fall on the left and right sides.",
" Match your gestures against the symbols for when they land on the pad.",
" No need to change gesture last minute, anticipation is key!",
" Keep your wrists still, just change your hand gesture.",
" Show two peace symbols to start!"];

// Initialize the index of the current bullet point
current_index = 0;

// Time between each bullet point (1.5 seconds in game frames)
display_interval = 1.5 * room_speed;

// Timer variable to track when to show the next bullet point
display_timer = display_interval;
