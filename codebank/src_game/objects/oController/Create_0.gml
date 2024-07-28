/// @description Initial Code
/// @author Toby Benjamin Clark
/// @date   14/01/2023

/* Find Savefile */
global.selected_colour = 0;
step = 0;

if(!file_exists("userbank/save.json")){
	create_new_save("PLAYER");
}

/* Set Mouse Cursor */
window_set_cursor(cr_default);