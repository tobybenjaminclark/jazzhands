/// @description Player must hold both symbols for 3 seconds to complete

// Initialize timer variable to track how long both symbols are held
hold_duration = 3 * room_speed;  // 3 seconds in game frames

// Check if left hand symbol is correct and handle the color and sound
if (global.left_hand == symb_string) {
    lcol = c_lime;
    if (!lflag) {
        audio_play_sound(sndPositive, 1, false, 0.2);
    }
    lflag = true;
} else if (lflag) { 
    resetCountdown();
}

// Check if right hand symbol is correct and handle the color and sound
if (global.right_hand == symb_string) {
    rcol = c_lime;
    if (!rflag) {
        audio_play_sound(sndPositive, 1, false, 0.2);
    }
    rflag = true;
} else if (rflag) {  // If right gesture changes, reset
    resetCountdown();
}

// Check if both flags are set and start or increment the hold timer
if (lflag && rflag) {
    hold_timer += 1;  // Increase timer if both are held
    
    // Calculate remaining time in seconds
    var time_remaining = 3 - floor(hold_timer / room_speed);

    // Play snd_metronome if the time has changed by a full second
    if (time_remaining < last_second) {
        audio_play_sound(snd_metronome, 1, false);
        last_second = time_remaining;  // Update last second to avoid replay
    }

    // Check if timer reached the required hold duration
    if (hold_timer >= hold_duration) {
        parent.done = true;
		audio_play_sound(ping_hard, 0, false);
		instance_create_layer(x, y, layer, oTutorialBlockVis, {side:"LEFT"});
		instance_create_layer(x, y, layer, oTutorialBlockVis, {side:"RIGHT"});
        instance_destroy(self); 
    }
} else {
    hold_timer = 0;  // Reset the timer if either hand symbol is released
    last_second = 3;  // Reset last second counter to 3
}

// Reset function to handle gesture change during countdown
function resetCountdown() {
    hold_timer = 0;
    last_second = 3;
    lflag = false;
    rflag = false;
    lcol = c_white;
    rcol = c_white;
    audio_play_sound(sndNegative, 1, false, 0.5);  // Play negative sound for feedback
}