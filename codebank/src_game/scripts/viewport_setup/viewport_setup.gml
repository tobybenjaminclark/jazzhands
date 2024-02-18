// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function viewport_setup()
{
	var base_w = 1920;
	var base_h = 1080;
	var max_w = display_get_width();
	var max_h = display_get_height();
	var aspect = display_get_width() / display_get_height();
	if (max_w < max_h)
	    {
	    // Scale for Portrait
	    var VIEW_WIDTH = min(base_w, max_w);
	    var VIEW_HEIGHT = VIEW_WIDTH / aspect;
	    }
	else
	    {
	    // Scale for Landscape
	    var VIEW_HEIGHT = min(base_h, max_h);
	    var VIEW_WIDTH = VIEW_HEIGHT * aspect;
	    }
	camera_set_view_size(view_camera[0], floor(VIEW_WIDTH), floor(VIEW_HEIGHT))
	view_wport[0] = max_w;
	view_hport[0] = max_h;
	surface_resize(application_surface, view_wport[0], view_hport[0]);
	
	var _check = true;
	var _rm = room_next(room);
	var  _rprev = _rm;

	while (_check = true)
	{
		var _cam = room_get_camera(_rm, 0);
		camera_destroy(_cam);
		var _newcam = camera_create_view((1024 - VIEW_WIDTH) div 2, (768 - VIEW_HEIGHT) div 2, VIEW_WIDTH, VIEW_HEIGHT);
		room_set_camera(_rm, 0, _newcam);
		room_set_viewport(_rm, 0, true, 0, 0, VIEW_WIDTH, VIEW_HEIGHT);
		room_set_view_enabled(_rm, true);
		if _rm = room_last
		{
			_check = false;
		}
		else
		{
			_rprev = _rm;
			_rm = room_next(_rprev);
		}
	}
}