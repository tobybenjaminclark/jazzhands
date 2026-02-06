var _x = 40;
var _y = 40;
var h = 28;

draw_set_font(fntRaananaSmall);
draw_set_color(c_white);

draw_text(_x, _y - 30, "Custom Levels:");

for (var i = 0; i < ds_list_size(custom_dirs); i++)
{
	var yy = _y + i * h;

	if (i == selected)
		draw_rectangle(_x - 5, yy - _2, _x + 200, yy + h - 2, false);

	draw_text(_x, yy, custom_dirs[| i]);
}
