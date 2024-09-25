/// @description Draw function to draw the heading and currently visible body.
/// @author Amber Swarbrick
/// @date   08/02/2023

/* Draw Text */
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(fntLevelNameSmall);
draw_text((display_get_gui_width() div 2), (display_get_gui_height() div 2) + 80, heading);

// Create body visible
draw_set_halign(fa_center)
draw_set_font(fntCutsceneText);
var body_visible="";
for(var i = 1; i <= show_index; i++)
{
	body_visible = body_visible + string_char_at(body, i);
}

draw_text((display_get_gui_width() div 2), (display_get_gui_height() div 2) + 130, body_visible);