/// @description Insert description here
// You can write your code in this editor

draw_self();
if(global.selected_save == save_index)
{
	draw_text(x, y, global.saves[save_index].username);
}
else if(global.selected_save != save_index)
{
	draw_text(x, y + 20, global.saves[save_index].username);
}