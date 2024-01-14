/// @description Open & Stage Beatmap File
/// @author Toby Benjamin Clark
/// @date   12/01/2023

/* Started */
start_time = 0;
paused = false;
unpaused_time = 0;
paused_time = 0;

/* Parse JSON from supplied beatmap path */
beatmap_structure = json_parse_from_filepath(beatmap_path);
if(beatmap_structure == undefined)
{
	global.queued_room = navrmMain;
	exit;
}

/* Validate Beatmap using `validate_beatmap` function. */
var beatmap_valid = validate_beatmap(beatmap_structure, beatmap_path);
if(!beatmap_valid)
{
	global.queued_room = navrmMain;
	exit;
}

/* Load Song */
sound = audio_create_stream(filepath_replace_last_element(beatmap_path, beatmap_structure.level_data.song));

/* Create Beat Events */
for(var event_index = 0; event_index < array_length(beatmap_structure.events); event_index++)
{
	switch(beatmap_structure.events[event_index].event_type)
	{
		case "beat":
			var reference_to_this = self;
			var inst = instance_create_layer(x,y,layer, class_symbol,{
				parent: reference_to_this,
				time: real(beatmap_structure.events[event_index].event_data.time),
				side: string(beatmap_structure.events[event_index].event_data.side),
				symbol: string(beatmap_structure.events[event_index].event_data.symbol),
				sprite_index: get_sprite_from_symbol(reference_to_this, string(beatmap_structure.events[event_index].event_data.symbol))
			});
		break;
		
		default:
		break;
	}
}