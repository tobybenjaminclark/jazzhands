/// @description Insert description here
// You can write your code in this editor

if(global.in_cutscene){return;}
draw_self();

var lvl_score = 0;
var psd = false;
var watched_cut = true;
with(oStageSpawnerBase){
	lvl_score = level_score;
	psd = paused;
	watched_cut = watched_cutscene;
}


/* Draw game (if in game) */
if(!global.in_cutscene && !psd && watched_cut == true){
	draw_set_halign(fa_center);
	
	draw_set_font(fntScore);
	// draw_text(x, y, string(paused_time) + "::" + string(unpaused_time) + " -> " + string(paused_time - unpaused_time));
	
	draw_text(x + 430, y + 184, string(lvl_score));
	
	draw_set_font(fntRaananaSmall);
	draw_text(x + 430, y + 200, "Power");
}
else if(psd){
		
}
