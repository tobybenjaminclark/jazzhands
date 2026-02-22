
/* Star is currently selected */
if (is_selected) {
	draw_set_font(fntLevelName);
	draw_set_color(c_yellow);
	draw_text(x, y + 60, level_name);
	draw_circle(x, y,  8, false);
}

/* Star is not selected */
else {
	draw_set_color(c_white);
	draw_circle(x, y, 6, false);	
}

/* Reset Draw Order */
draw_set_color(c_white);

/* Draw selector */
if (is_selected) {
    sel_t += sel_spd;

    // smooth pulse 0..1
    var p = 0.5 + 0.5 * sin(sel_t);

    // scale around base
    var sc = (sel_base + sel_amp * p) / 8;

    // keep alpha solid, or pulse it slightly if you want:
    draw_set_alpha(1);

    // draw centered on the star
    draw_sprite_ext(
        sprPlanetSelector,
        0,
        x, y,
        sc, sc,
        0,
        c_white,
        1
    );

    draw_set_alpha(1);
}