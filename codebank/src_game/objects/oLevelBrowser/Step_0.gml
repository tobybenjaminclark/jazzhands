// --- input navigation ---
if (keyboard_check_pressed(vk_left))  _select(selected.n_left);
if (keyboard_check_pressed(vk_right)) _select(selected.n_right);
if (keyboard_check_pressed(vk_up))    _select(selected.n_up);
if (keyboard_check_pressed(vk_down))  _select(selected.n_down);

// --- smooth pan toward target ---
view_off_x = lerp(view_off_x, target_off_x, pan_speed);
view_off_y = lerp(view_off_y, target_off_y, pan_speed);

_apply_offset_to_all();