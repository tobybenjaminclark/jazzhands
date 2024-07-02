/*
if instance_exists(o_test) {
	o_test.image_xscale = 1+value_;
	o_test.image_yscale = 1+value_;
}*/

var num = audio_get_listener_count();
for( var i = 0; i < num; i++;)
{
    var info = audio_get_listener_info(i);
    audio_set_master_gain(info[? "index"], value_);
    ds_map_destroy(info);
}