// Define a structure to store country data
global.countries = ds_map_create();

// Parse JSON data into a map
try {
	parsed_json = json_parse_from_filepath("languages/codes.json");
}
catch(e){
	show_message(string(e));	
	return;
}

if(parsed_json == undefined){
	show_message("Couldn't parse languages");
	return;
}

// Load each flag image and store its information
selected_language = "";
country_codes = variable_struct_get_names(parsed_json);
var country_count = array_length(country_codes);

for (var i = 0; i < country_count; i++) {
    var code = country_codes[i]
    var name = struct_get(parsed_json, code);
    var flag_path = "languages/flagbank/" + code + ".png";
    var flag_sprite = sprite_add(flag_path, 1, false, false, 0, 0);
	
	if(flag_sprite == undefined || flag_sprite == -1){
		show_message("languages/flagbank/" + code + ".png");
	}
    
    //var country_info = ds_map_create();
    //ds_map_add(country_info, "name", name);
    //ds_map_add(country_info, "flag_sprite", flag_sprite);
    ds_map_add(global.countries, code, flag_sprite);
}

