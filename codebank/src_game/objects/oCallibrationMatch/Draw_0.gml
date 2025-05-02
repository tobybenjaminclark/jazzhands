/// @description Display the countdown timer if both symbols are held

// Draw the symbols as in your original draw code
draw_set_font(fntLevelName);
draw_sprite_ext(symb_sprite, 0, room_width div 2 - 350, room_height div 2, -1, 1, 0, lcol, 1);
draw_sprite_ext(symb_sprite, 0, room_width div 2 + 350, room_height div 2,1, 1, 0, rcol, 1);


// Display countdown if both flags are active
draw_set_halign(fa_center);

draw_set_font(fntLevelNameSmall);
draw_text(room_width div 2 - 350, room_height div 2 + 100, "LEFT");
draw_text(room_width div 2 + 350, room_height div 2 + 100, "RIGHT");

draw_set_font(fntLevelName);
if (lflag && rflag) {
    var time_remaining = 3 - floor(hold_timer / room_speed);
    draw_text(room_width div 2, room_height div 2 - 20, string(time_remaining) + "s remaining");
	draw_set_font(fntLevelNameSmall);
	draw_text(room_width div 2, room_height div 2 + 50, "Great job, keep holding!");
}
else {
	draw_text(room_width div 2, room_height div 2 - 20, "Target Gestures");
	draw_set_font(fntLevelNameSmall);
	draw_text(room_width div 2, room_height div 2 + 50, "Hold these for 3s");
}

draw_set_halign(fa_center);
draw_set_font(fntLevelNameTiny);
draw_text(room_width div 2, room_height div 2 + 300, "< YOUR GESTURES >");
