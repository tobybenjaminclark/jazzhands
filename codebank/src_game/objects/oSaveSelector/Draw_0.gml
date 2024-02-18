/// @description Insert description here
// You can write your code in this editor
draw_self();

if(global.selected_save == save_index)
{
	draw_text(x, y, global.saves[save_index].username);
}
else if(global.selected_save != save_index)
{
	draw_text(x, y + 60, global.saves[save_index].username);
}

if(hover)
{
	draw_sprite_ext(sprGlow, 0, x, y, 0.3, 0.3, 0, c_white, 0.5);
}

//And then, after drawing the sprites I wanted to be on top of the object

draw_self();