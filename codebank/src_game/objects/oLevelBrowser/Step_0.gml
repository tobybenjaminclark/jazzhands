// --- input navigation ---
if (keyboard_check_pressed(vk_left))  _select(selected.n_left);
if (keyboard_check_pressed(vk_right)) _select(selected.n_right);
if (keyboard_check_pressed(vk_up))    _select(selected.n_up);
if (keyboard_check_pressed(vk_down))  _select(selected.n_down);

if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_up)) || keyboard_check_pressed(vk_down) {
	audio_play_sound(snd_ping_gentle, 1, 0);
}



// Step event (oLevelBrowser)
view_off_x = lerp(view_off_x, target_off_x, pan_speed);
view_off_y = lerp(view_off_y, target_off_y, pan_speed);

// dead-zone so it stops moving forever
if (abs(view_off_x - target_off_x) < 0.05) view_off_x = target_off_x;
if (abs(view_off_y - target_off_y) < 0.05) view_off_y = target_off_y;

_apply_offset_to_all();