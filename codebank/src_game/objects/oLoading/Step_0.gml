// Increment the current time
curr_time += delta_time / 1000000;  // Use delta_time for smooth increment (milliseconds to seconds)

// Cap the time to the loading time (so it doesn't exceed it)
if (curr_time > loading_time) {
    curr_time = loading_time;
}

// Calculate the percentage of progress (0-100)
progress = (curr_time / loading_time) * 100;

/* wait for finish or dev overcheat (left and right hold) */
if (progress >= 100) || (keyboard_check_pressed(vk_left) && keyboard_check_pressed(vk_right)) {
	room_goto(rmInitialize);
	audio_stop_all();
}
