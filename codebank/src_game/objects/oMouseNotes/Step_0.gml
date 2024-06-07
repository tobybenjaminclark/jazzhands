/// @description Updates Emitter Position to Mouse
/// @author Toby Benjamin Clark
/// @date   07/06/2024

/* Update the position of the emitter to the mouse's current position */
if(mouse_x != pmx and mouse_y != pmy){
	part_emitter_region(_ps, _pemit1, mouse_x - 16, mouse_x + 16, mouse_y - 16, mouse_y + 16, ps_shape_rectangle, ps_distr_gaussian);
	pmx = mouse_x;
	pmy = mouse_y;
}
else{
	part_emitter_region(_ps, _pemit1, 0 - 16, 0 + 16, -32 - 16, -32 + 16, ps_shape_rectangle, ps_distr_gaussian);
	pmx = 0;
	pmy = 0;	
}
