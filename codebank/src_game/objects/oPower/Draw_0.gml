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

draw_set_font(fntAlarmClock);
draw_set_halign(fa_center);
draw_set_color(#f8c53a)
draw_text(x, y + 70, string(lvl_score));