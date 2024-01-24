/// @description Initial Code
/// @author Toby Benjamin Clark
/// @date   14/01/2023

/* Find Savefile */

global.selected_colour = 0;

step = 0;
saves = load_saves();
if(array_length(global.saves) < 1)
{
	/* No save (Go to Save Creator Screen) */
	target_room = rmSaveCreator;
}
else
{
	target_room = navrmMain;
}

