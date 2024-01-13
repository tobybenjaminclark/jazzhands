/// @description Insert description here
// You can write your code in this editor

draw_self();

if(text_alpha != 0)
{
	draw_set_alpha(text_alpha);
	draw_set_halign(fa_left);
	draw_set_font(fntRaanana);
	draw_text(x + 70, y - 25, title);
	draw_set_font(fntRaananaSmall);
	draw_text(x + 70, y + 25, description);
}






