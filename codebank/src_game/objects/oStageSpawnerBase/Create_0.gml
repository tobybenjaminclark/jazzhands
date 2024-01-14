/// @description Open & Stage Beatmap File
/// @author Toby Benjamin Clark
/// @date   12/01/2023

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

/* TODO Load Song */

inst = instance_create_layer(x, y, layer, class_symbol);
inst.sprite_index = sprite_victory;