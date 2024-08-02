/// @description Handles Debug Drawing
/// @author Toby Benjamin Clark
/// @date   14/01/2023


draw_self();

draw_set_color(c_red);

if(boulder){
	draw_sprite_ext(sprSpaceJunk, 0, x, y, 1, 1, boulder_rot, c_white, 1);
}