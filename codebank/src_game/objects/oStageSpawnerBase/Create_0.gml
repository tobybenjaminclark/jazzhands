/// @description Open & Stage Beatmap File
/// @author Toby Benjamin Clark
/// @date   12/01/2023


/* Score Variables */
level_score = 0;
started = false;
global.disco_mode = false;
global.hit_beats = 0;


/* Started Variables */
start_time = 0;
paused = false;
unpaused_time = 0;
paused_time = 0;
watched_cutscene = false;
has_shown_end_screen = false;
alt_start_time = start_time;
last_time = alt_start_time;
blip_x = 0;
has_post_cutscene = false;
spawned_powerball = false;

/* Chain (combo list) */
combo_list = ds_list_create();

/* Get Global Beatmap Path */
if(global.current_beatmap != undefined){
	beatmap_path = global.current_beatmap;
}


/* For start (get background for intro scene) */
intro_delay = INTRO_DELAY;
cutscene_file = filepath_replace_last_element(beatmap_path, "cutscene.json");

/* Check for post cutscene */
post_cutscene_path = filepath_replace_last_element(beatmap_path, "post_cutscene.json");
if(file_exists(post_cutscene_path)) has_post_cutscene = true;

/* Draw intro bg */
if(file_exists(cutscene_file)){
	json_struct = json_parse_from_filepath(cutscene_file);
	if(variable_struct_exists(json_struct, "frames")){
		var _background_path = cutscene_get_background_path(json_struct.frames[0]);
	}
	var _background_path = filepath_replace_last_element(cutscene_file, _background_path);
	background_sprite = sprite_add(_background_path, 1, false, true, 0, 0);	
}
else{
	background_sprite = spr_black_box;
}

/* Parse JSON from supplied beatmap path */
beatmap_structure = json_parse_from_filepath(beatmap_path);
level_name = beatmap_structure.level_data.level_name;
level_description = beatmap_structure.level_data.description;


if(beatmap_structure == undefined){
	global.queued_room = navrmMain;
	exit;
}


/* Validate Beatmap using `validate_beatmap` function. */
var beatmap_valid = validate_beatmap(beatmap_structure, beatmap_path);
if(!beatmap_valid){
	global.queued_room = navrmMain;
	exit;
}


/* Load Song */
sound = audio_create_stream(filepath_replace_last_element(beatmap_path, beatmap_structure.level_data.song));
sound_len = audio_sound_length(sound);
end_time = current_time + 99999999999999;


global.total_beats = 0;

if(variable_struct_exists(beatmap_structure.level_data, "speed")) {
	allbeat_speed = beatmap_structure.level_data.speed;
} else {
	allbeat_speed = DEFAULT_BEAT_SPEED;
}


/* Create Beat Events */
for(var event_index = 0; event_index < array_length(beatmap_structure.events); event_index++){
	var reference_to_this = self;
	var lyr = "Instances";
	
	global.total_beats = global.total_beats + 1;
	
	if(variable_struct_exists(beatmap_structure.events[event_index].event_data, "speed")){
		thisbeat_speed = beatmap_structure.events[event_index].event_data.speed;
	} else {
		thisbeat_speed = allbeat_speed;
	}
	
	switch(beatmap_structure.events[event_index].event_type){
		case "beat":
			var inst = instance_create_layer(x,y,lyr, class_beat_event,{
				parent: reference_to_this,
				time: real(beatmap_structure.events[event_index].event_data.time),
				side: string(beatmap_structure.events[event_index].event_data.side),
				symbol: string(beatmap_structure.events[event_index].event_data.symbol),
				sprite_index: get_sprite_from_symbol(reference_to_this, string(beatmap_structure.events[event_index].event_data.symbol)),
				image_xscale: 0.6,
				image_yscale: 0.6,
				movement_factor: thisbeat_speed
			});
		break;
		
		case "randombeat":
			var inst = instance_create_layer(x,y,lyr, class_randombeat_event,{
				parent: reference_to_this,
				time: real(beatmap_structure.events[event_index].event_data.time),
				side: string(beatmap_structure.events[event_index].event_data.side),
				symbol: string(beatmap_structure.events[event_index].event_data.symbol),
				sprite_index: get_sprite_from_symbol(reference_to_this, string(beatmap_structure.events[event_index].event_data.symbol)),
				image_xscale: 0.6,
				image_yscale: 0.6,
				movement_factor: thisbeat_speed
			});
		break;
		
		case "bouldered_beat":
			var inst = instance_create_layer(x,y,lyr, class_bouldered_beat_event,{
				parent: reference_to_this,
				time: real(beatmap_structure.events[event_index].event_data.time),
				side: string(beatmap_structure.events[event_index].event_data.side),
				symbol: string(beatmap_structure.events[event_index].event_data.symbol),
				sprite_index: get_sprite_from_symbol(reference_to_this, string(beatmap_structure.events[event_index].event_data.symbol)),
				image_xscale: 0.6,
				image_yscale: 0.6,
				movement_factor: thisbeat_speed
			});
		break;
		
		case "space_junk_beat":
			var inst = instance_create_layer(x,y,lyr, class_space_junk_beat_event,{
				parent: reference_to_this,
				time: real(beatmap_structure.events[event_index].event_data.time),
				side: string(beatmap_structure.events[event_index].event_data.side),
				symbol: string(beatmap_structure.events[event_index].event_data.symbol),
				sprite_index: get_sprite_from_symbol(reference_to_this, string(beatmap_structure.events[event_index].event_data.symbol)),
				image_xscale: 0.6,
				image_yscale: 0.6,
				movement_factor: thisbeat_speed
			});
		break;
		
		case "bad_beat":
			var inst = instance_create_layer(x,y,lyr, class_bad_beat_event,{
				parent: reference_to_this,
				time: real(beatmap_structure.events[event_index].event_data.time),
				side: string(beatmap_structure.events[event_index].event_data.side),
				symbol: string(beatmap_structure.events[event_index].event_data.symbol),
				sprite_index: get_sprite_from_symbol(reference_to_this, string(beatmap_structure.events[event_index].event_data.symbol)),
				image_xscale: 0.6,
				image_yscale: 0.6,
				movement_factor: thisbeat_speed
			});
		break;
		
		case "hold":
			var inst = instance_create_layer(x,y,lyr, class_hold_event,{
				parent: reference_to_this,
				start_time: real(beatmap_structure.events[event_index].event_data.start_time),
				end_time: real(beatmap_structure.events[event_index].event_data.end_time),
				side: string(beatmap_structure.events[event_index].event_data.side),
				symbol: string(beatmap_structure.events[event_index].event_data.symbol),
				sprite_index: get_sprite_from_symbol(reference_to_this, string(beatmap_structure.events[event_index].event_data.symbol)),
				image_xscale: 0.6,
				image_yscale: 0.6,
				movement_factor: thisbeat_speed
			});
		break;
		
		default:
		break;
	}
	
	// Level Visualisation (need to switch this to be included in beatmap)
	if(global.numerical_level <= 4) {
		instance_create_layer(x, y, "SuperGlowLayer", oTikiVis, {twin: inst});
	} else if (global.numerical_level <= 8) {
		instance_create_layer(x, y, "SuperGlowLayer", oBlockLaserVis, {twin: inst});
	} else if (global.numerical_level <= 12) {
		instance_create_layer(x, y, "SuperGlowLayer", oCrossLaserVis, {twin: inst});
	} else if (global.numerical_level <= 16) {
		instance_create_layer(x, y, "SuperGlowLayer", oFunkLaser, {twin: inst});
	} else if (global.numerical_level <= 20) {
		instance_create_layer(x, y, "SuperGlowLayer", oLaserVis, {twin: inst});
	}
}

