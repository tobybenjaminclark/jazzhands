/// @description Insert description here
// You can write your code in this editor


if(global.in_cutscene){
	return;	
}

draw_self();

var _killline = 0;
var _return = false;
with(oStageSpawnerBase){
	if(intro_delay >= 0){
		_return = true;
	}
	_killline = kill_line;
}
if (_return) return;



var _left_hand = 0;
switch(global.left_hand)
{
	case "OPEN_PALM":
		_left_hand = sprSymbolOpenPalmBase;
		break;
	case "CLOSED_FIST":
		_left_hand = sprSymbolClosedFistBase;
		break;
	case "VICTORY":
		_left_hand = sprSymbolVictoryBase;
		break;
	case "POINTING_UP":
		_left_hand = sprSymbolPointUpBase;
		break;
	case "THUMBS_DOWN":
		_left_hand = sprSymbolThumbsDownBase;
		break;
	case "THUMBS_UP":
		_left_hand = sprSymbolThumbsUpBase;
		break;
	default:
		_left_hand = sprUnknownSymbol;
}		
draw_sprite_ext(_left_hand, 0, x - 154, _killline - 25, 0.7, 0.7, 0, c_white, 1);

var _left_hand = 0;
switch(global.right_hand)
{
	case "OPEN_PALM":
		_left_hand = sprSymbolOpenPalmBase;
		break;
	case "CLOSED_FIST":
		_left_hand = sprSymbolClosedFistBase;
		break;
	case "VICTORY":
		_left_hand = sprSymbolVictoryBase;
		break;
	case "POINTING_UP":
		_left_hand = sprSymbolPointUpBase;
		break;
	case "THUMBS_DOWN":
		_left_hand = sprSymbolThumbsDownBase;
		break;
	case "THUMBS_UP":
		_left_hand = sprSymbolThumbsUpBase;
		break;
	default:
		_left_hand = sprUnknownSymbol;
}		
draw_sprite_ext(_left_hand, 0, x + 154, _killline - 25, 0.7, 0.7, 0, c_white, 1);

draw_set_font(fntLevelName);
draw_text(x, y + 80, string(global.score_multiplier) + "x");
draw_set_font(fntLevelNameSmall);
draw_text(x, y + 135, "Multiplier");