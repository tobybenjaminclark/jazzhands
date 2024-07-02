/// @description Insert description here
// You can write your code in this editor

event_inherited();

var num = audio_get_listener_count();
var total = 0;
for( var i = 0; i < num; i++;)
{
    var info = audio_get_listener_info(i);
    total += audio_get_master_gain(info[? "index"]);
    ds_map_destroy(info);
}
value_ = total / num;

