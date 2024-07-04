/// @description Handles Debug Drawing
/// @author Toby Benjamin Clark
/// @date   14/01/2023


draw_self();

draw_set_color(c_red);

if(boulder){
	draw_rectangle(x - 20, y - 20, x + 20, y + 20, false);
}