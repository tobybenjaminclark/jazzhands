
draw_set_color(c_white);

/* Star is currently selected */
if (is_selected) {
	draw_set_font(fntLevelName);
	draw_text(x, y + 80, level_name);
}

/* Reset Draw Order */
draw_set_color(c_white);

/* Draw selector */
if (is_selected) {
    sel_t += sel_spd;

    // smooth pulse 0..1
    var p = 0.5 + 0.5 * sin(sel_t);

    // scale around base
    var sc = (sel_base + sel_amp * p) / 7;

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

/*
 * Draw Star 
 */

/// Draw Event: Shimmering triangle-star
/// Draw Event: same tempo, different offset, steadier alpha

var cx = x;
var cy = y;

var points      = 5;
var layers      = 24;
var base_radius = is_selected ? 245 : 90;
var tri_width   = 0.55;

var alpha_base  = 0.07;
var alpha_jit   = 0.012;        // small shimmer only

var tempo       = 1.0;          // shared tempo for all stars
var t           = (current_time * 0.001) * tempo + phase;

gpu_set_blendmode(bm_add);
draw_set_color(c_white);

draw_primitive_begin(pr_trianglelist);

for (var i = 0; i < layers; i++)
{
    var a0   = (i / layers) * 360;
    var snap = round((a0 / 360) * points) / points * 360;
    var a    = lerp(a0, snap, 0.35);

    var wob  = sin(t * 2.0 + i * 0.7) * 8;
    var spin = t * 20;
    var ang  = a + wob + spin;

    var r = base_radius * (0.9 + 0.15 * sin(t * 1.5 + i));

    var w = tri_width * (0.9 + 0.1 * sin(t * 1.8 + i * 1.3));

    var ox = sin(t * 0.9 + i) * 1.5;
    var oy = cos(t * 0.8 + i) * 1.5;

    var tipx = cx + lengthdir_x(r, ang) + ox;
    var tipy = cy + lengthdir_y(r, ang) + oy;

    var base_r = r * 0.35;
    var spread = 28 * w;

    var b1x = cx + lengthdir_x(base_r, ang + 180 - spread) + ox;
    var b1y = cy + lengthdir_y(base_r, ang + 180 - spread) + oy;

    var b2x = cx + lengthdir_x(base_r, ang + 180 + spread) + ox;
    var b2y = cy + lengthdir_y(base_r, ang + 180 + spread) + oy;

    // Much steadier alpha
    var toward_point = 1.0 - abs(angle_difference(a0, snap)) / 180;
    var a_tri = alpha_base 
                + alpha_jit * sin(t * 1.7 + i)
                + 0.01 * toward_point;

    a_tri = clamp(a_tri, 0.04, 0.09);

    draw_set_alpha(a_tri);

	// Deterministic per-triangle colour (stable across frames)
	var n  = frac(sin((star_seed * 0.001 + i * 13.13) * 12.9898) * 43758.5453); // 0..1
	var n2 = frac(sin((star_seed * 0.002 + i * 7.77)  * 78.233)  * 12345.6789); // 0..1

	var hue = star_hue + (n - 0.5) * (star_hue_range * 2);
	hue = (hue % 360 + 360) % 360;

	var sat01 = star_sat_base + (n2 - 0.5) * (star_sat_range * 2);
	sat01 = clamp(sat01, 0.02, 0.25);

	// keep value high so it stays "white-ish"
	draw_set_color(make_color_hsv(hue, sat01 * 255, 255));

    draw_vertex(tipx, tipy);
    draw_vertex(b1x, b1y);
    draw_vertex(b2x, b2y);
}

draw_primitive_end();

draw_set_alpha(1);
gpu_set_blendmode(bm_normal);