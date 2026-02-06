var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var _x = 40;
var _y = 40;
var h = 28;

for (var i = 0; i < ds_list_size(custom_dirs); i++)
{
	var yy = _y + i * h;

	if (point_in_rectangle(mx, my, _x, yy, _x + 200, yy + h))
	{
		selected = i;
		show_debug_message("Selected folder: " + custom_dirs[| i]);
		break;
	}
}
