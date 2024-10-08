// Increment the current time
curr_time += delta_time / 1000000;  // Use delta_time for smooth increment (milliseconds to seconds)

// Cap the time to the loading time (so it doesn't exceed it)
if (curr_time > loading_time) {
    curr_time = loading_time;
}

// Calculate the percentage of progress (0-100)
progress = (curr_time / loading_time) * 100;

if progress >= 100 {
	room_goto(rmInitialize);
}
