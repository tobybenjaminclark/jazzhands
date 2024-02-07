/// @description Open & Stage Beatmap File
/// @author Toby Benjamin Clark
/// @date   12/01/2023

/* Started */
start_time = 0;
paused = false;
unpaused_time = 0;
paused_time = 0;

show_message(beatmap_path)

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
	var reference_to_this = self;
	switch(beatmap_structure.events[event_index].event_type)
	{
		case "beat":
			var inst = instance_create_layer(x,y,layer, class_beat_event,{
				parent: reference_to_this,
				time: real(beatmap_structure.events[event_index].event_data.time),
				side: string(beatmap_structure.events[event_index].event_data.side),
				symbol: string(beatmap_structure.events[event_index].event_data.symbol),
				sprite_index: get_sprite_from_symbol(reference_to_this, string(beatmap_structure.events[event_index].event_data.symbol))
			});
		break;
		
		case "bad_beat":
			var inst = instance_create_layer(x,y,layer, class_bad_beat_event,{
				parent: reference_to_this,
				time: real(beatmap_structure.events[event_index].event_data.time),
				side: string(beatmap_structure.events[event_index].event_data.side),
				symbol: string(beatmap_structure.events[event_index].event_data.symbol),
				sprite_index: get_sprite_from_symbol(reference_to_this, string(beatmap_structure.events[event_index].event_data.symbol))
			});
		break;
		
		case "hold":
			var inst = instance_create_layer(x,y,layer, class_hold_event,{
				parent: reference_to_this,
				start_time: real(beatmap_structure.events[event_index].event_data.start_time),
				end_time: real(beatmap_structure.events[event_index].event_data.end_time),
				side: string(beatmap_structure.events[event_index].event_data.side),
				symbol: string(beatmap_structure.events[event_index].event_data.symbol),
				sprite_index: get_sprite_from_symbol(reference_to_this, string(beatmap_structure.events[event_index].event_data.symbol))
			});
		break;
		
		default:
		break;
	}
}