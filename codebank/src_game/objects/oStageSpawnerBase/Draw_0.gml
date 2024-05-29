/// @description Handles Debug Drawing
/// @author Toby Benjamin Clark
/// @date   14/01/2023

if(!global.in_cutscene && !paused){
	draw_set_font(fntScore);
	draw_line(0, kill_line, room_width, kill_line);
	// draw_text(x, y, string(paused_time) + "::" + string(unpaused_time) + " -> " + string(paused_time - unpaused_time));
	
	draw_text(x, y+420, string(level_score));
	
	draw_set_font(fntRaananaSmall);
	draw_text(x, y+450, "Power");
}
else if(!global.in_cutscene && paused){
	draw_set_font(fntScore);
	draw_text(x, y+10, "Paused");
}

try{
	draw_set_halign(fa_right);
	draw_set_font(fntRaananaTiny);
	draw_text(room_width - 15, 25, beatmap_structure.level_data.level_name);
}
catch(e){
}





