/// @description Insert description here
// You can write your code in this editor

var rv = create_new_save(global.input_text, global.selected_colour);
show_message(rv);

if(rv == "success")
{
	load_saves();
	global.queued_room = navrmMain;
}






