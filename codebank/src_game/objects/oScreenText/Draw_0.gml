/// @description Insert description here
// You can write your code in this editor

/// @description Draw function to draw the heading and currently visible body.
/// @author Amber Swarbrick
/// @date   08/02/2023



/* Draw Text */
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(fntCutsceneHeading);
draw_text(x, y, heading);

// create body visible

draw_set_font(fntCutsceneText);
var body_visible="";
for(var i = 1; i <= show_index; i++)
{
	body_visible = body_visible + string_char_at(body, i);
}

draw_text(x, y + 50, body_visible);