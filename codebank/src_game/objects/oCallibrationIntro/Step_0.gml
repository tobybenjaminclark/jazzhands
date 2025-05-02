/// @description Display bullet points one after the other

// Countdown the display timer
display_timer -= 1;

if (display_timer <= 0) {
    // Move to the next bullet point if there are more in the list
    if (current_index < array_length(bullet_points) - 1) {
        current_index += 1;
        display_timer = display_interval;  // Reset the timer
		audio_play_sound(snd_metronome, 0, false);
    }
	else if display_timer < 0 - 6 * room_speed {
		parent.intro_done = true;
		instance_destroy(self);
		
	}
}
