// Define starting position and spacing for flags and names
var x_start = 60;
var y_start = 50;
var y_spacing = 50;

var index = 0;

// Retrieve all keys (country codes) from the global.countries struct
var country_count = array_length(country_codes);

/* Draw selected language */
draw_set_halign(fa_center);
draw_set_font(fntLevelName);
draw_text(room_width div 2, room_height - 150, selected_language);

for (var i = 0; i < country_count; i++) {
    var code = country_codes[i];
    var flag_sprite = global.countries[? code];
	
    //var flag_sprite = country_info.flag_sprite;
    //var name = country_info.name;
    
    // Draw flag
    try{
		var _y = y_start + index * y_spacing;
		draw_sprite(flag_sprite, 0, x_start, _y);
		if(mouse_x > x_start && mouse_x < x_start + sprite_get_width(flag_sprite) &&
		   mouse_y > _y && mouse_y < _y + sprite_get_height(flag_sprite)){
			
			draw_sprite_ext(sprPlanetSelector, 0, 
				x_start + sprite_get_width(flag_sprite) div 2,
				_y + sprite_get_height(flag_sprite) div 2, 0.05, 0.035, 0, c_white, 1);
			  
			draw_set_halign(fa_center);
			draw_set_font(fntLevelName);
			var c_name = struct_get(parsed_json, code);
			if(mouse_check_button_pressed(mb_left)){
				selected_language = c_name;
			}
			
			
		}
	}
	catch(e){
		show_message(string(flag_sprite));	
	}
    
    // Draw country name
    //draw_text(x_start + 100, y_start + index * y_spacing, name);
    
    // Increment index for next country
    index += 1;
	
	if(index % 10 == 0){
		x_start += 50;
		index = 0;
	}
}
