if (current_time >= end_time) {
    if (countdown > 1) {
        countdown--;
        end_time = current_time + 1000; // 1 second from now in milliseconds
        audio_play_sound(snd_metronome, 0, false, 0.4);
    } else {
        audio_play_sound(snd, 100, false);
        instance_destroy();
    }
}
