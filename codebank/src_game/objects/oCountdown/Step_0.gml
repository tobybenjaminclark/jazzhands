// Step Event
if (timer > 0) {
    timer--;
} else {
    if (countdown > 1) {
        countdown--;
        timer = room_speed;
		audio_play_sound(snd_metronome, 0, false, 0.4);
    } else {
		audio_play_sound(snd, 100, false);
        instance_destroy();
    }
}
