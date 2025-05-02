/// @description Insert description here
// You can write your code in this editor


if (intro_done) {
	heading = "Let's Calibrate!"
	instance_create_layer(room_width div 2 + 300, room_height div 2 + 300, layer, oRightHandVis);
	instance_create_layer(room_width div 2 - 300, room_height div 2 + 300, layer, oLeftHandVis);
	
	current_heading = 1;
	current_text = 1;
	with(oCallibrationDiagram){
		instance_destroy(self);
	}
	
	var _self = self;
	instance_create_layer(x, y, layer, oCallibrationMatch, {
	symb_string: "OPEN_PALM",
	symb_sprite: sprSymbolOpenPalmBase,
	parent:_self})
	number_of_matches_created = number_of_matches_created + 1;
	intro_done = false;	
}

if(done) {done_step = done_step + 1;}

if (done && number_of_matches_created == 1 && done_step > 50) {
	var _self = self;
	instance_create_layer(x, y, layer, oCallibrationMatch, {
	symb_string: "CLOSED_FIST",
	symb_sprite: sprSymbolClosedFistBase,
	parent:_self})
	done = false;
	number_of_matches_created = number_of_matches_created + 1;
}

if (done && number_of_matches_created == 2 && done_step > 100) {
	var _self = self;
	instance_create_layer(x, y, layer, oCallibrationMatch, {
	symb_string: "VICTORY",
	symb_sprite: sprSymbolVictoryBase,
	parent:_self})
	done = false;
	number_of_matches_created = number_of_matches_created + 1;
}

if(done && number_of_matches_created == 3 && done_step > 130) {
	instance_create_layer(x, y, layer, oCallibrationDiagram);
	heading = "How to play!";
	number_of_matches_created = number_of_matches_created + 1;
}