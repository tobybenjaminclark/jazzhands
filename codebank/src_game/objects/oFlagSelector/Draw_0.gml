// Define starting position and spacing for flags and names
var x_start = 10;
var y_start = 10;
var y_spacing = 50;

var index = 0;

// Retrieve all keys (country codes) from the global.countries struct
var country_count = array_length(country_codes);

for (var i = 0; i < country_count; i++) {
    var code = country_codes[i];
    var flag_sprite = global.countries[? code];
	
    //var flag_sprite = country_info.flag_sprite;
    //var name = country_info.name;
    
    // Draw flag
    try{
		draw_sprite(flag_sprite, 0, x_start, y_start + index * y_spacing);
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
