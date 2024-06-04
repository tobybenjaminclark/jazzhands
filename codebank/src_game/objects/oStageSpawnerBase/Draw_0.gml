/// @description Handles Debug Drawing
/// @author Toby Benjamin Clark
/// @date   14/01/2023

try{
	draw_set_halign(fa_right);
	draw_set_font(fntRaananaTiny);
	draw_text(room_width - 15, 25, beatmap_structure.level_data.level_name);
}
catch(e){
}

// Pre intro draw
if(intro_delay > 0) {
    var x_scale = room_width / sprite_get_width(background_sprite);
    var y_scale = room_height / sprite_get_height(background_sprite);
    draw_sprite_ext(background_sprite, 0, 0, 0, x_scale, y_scale, 0, c_white, 1);
    
    var _sw = sprite_get_width(spr_black_box);
    var _sh = sprite_get_height(spr_black_box);
    var _xsc = (room_width + 10) / _sw;
    var _ysc = (room_height / 2) / _sh;
    draw_sprite_ext(spr_black_box, 0, -10, (room_height div 2) + 70, _xsc, _ysc, 0, c_white, 0.85);
    
    draw_set_color(c_white);
    draw_set_font(fntCutsceneHeading);
    draw_text(room_width div 2, (room_height div 2) + 96, level_name);
    
    draw_set_font(fntCutsceneText);
    draw_set_halign(fa_center);
    draw_text(room_width div 2, (room_height div 2) + 135, level_description);
    
    draw_set_color(c_white);
    draw_line(0, (room_height div 2) + 70, room_width, (room_height div 2) + 70);
}


// Draw game (if in game)
if(!global.in_cutscene && !paused && watched_cutscene == true){
	draw_set_font(fntScore);
	// draw_text(x, y, string(paused_time) + "::" + string(unpaused_time) + " -> " + string(paused_time - unpaused_time));
	
	draw_text(x, y+420, string(level_score));
	
	draw_set_font(fntRaananaSmall);
	draw_text(x, y+450, "Power");
}

// Draw paused if paused
else if(!global.in_cutscene && paused){
	draw_set_font(fntScore);
	draw_text(x, y+10, "Paused");
}

// Draw Music Bar
draw_set_color(c_white);

var inset = 50;
var width = 500;
var thickness = 3;
var bar_height = 10;
for(var _t = 0; _t < thickness; _t++)
{
	draw_line(inset - _t, room_height - bar_height - inset, inset - _t, room_height + bar_height - inset);
	draw_line(inset, room_height - inset - _t, inset + width, room_height - inset - _t);
	draw_line(inset - _t + width, room_height - bar_height - inset, inset - _t + width, room_height + bar_height - inset);
}

// Draw Caption
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fntCutsceneTiny);
var sound_string = string(audio_sound_length(sound) div 60) + ":" + string(round(audio_sound_length(sound) mod 60));
draw_text(inset - (thickness div 2) + width, room_height + bar_height - inset + 3, sound_string);
draw_text(inset - (thickness div 2), room_height + bar_height - inset + 3, "0:00");

// Draw blip (current song position)
var _r = 5;
if(started and current_time >= start_time){
	var _x = inset + (((current_time - start_time) / (audio_sound_length(sound)*1000)) * width);
	var _y = room_height - inset - (thickness div 2);
	draw_circle(_x, _y, _r, false);
}

// Draw Record & Label
var _s = 0.1;
var _x = inset + (sprite_get_width(sprRecord) div 2) * _s;
var _y = room_height - bar_height - inset - (thickness div 2) - (sprite_get_width(sprRecord) div 2) * _s;
draw_sprite_ext(sprRecord, 0, _x, _y, _s, _s, 0, c_white, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(_x + ((sprite_get_width(sprRecord) div 2) * _s), _y, level_name);



