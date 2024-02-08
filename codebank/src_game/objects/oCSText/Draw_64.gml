/// @description Draw function to draw the heading and currently visible body.
/// @author Amber Swarbrick
/// @date   08/02/2023


draw_text(x, y, heading);

// create body visible

var body_visible="";

for(var i = 1; i <= text_index; i++)
{
	body_visible = body_visible + string_char_at(body, i);
}

draw_text(x, y + 20, body_visible);