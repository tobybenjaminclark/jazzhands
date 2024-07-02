/// @description Check for no longer selected
if mouse_check_button_pressed(mb_left) {
	var button_x = x+sprite_width*value_;
	var button_y = y;
	var button_radius = sprite_get_width(s_slider_button)/2;
	if point_in_circle(mouse_x, mouse_y, button_x, button_y, button_radius) {
		selected_ = true;
	}
}

if !mouse_check_button(mb_left) {
	selected_ = false;
}

if selected_ {
	value_ = clamp((mouse_x-x)/sprite_width, 0, max_value_);
	event_user(0);
}
