/// @description Insert description here
// You can write your code in this editor

draw_self();

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
draw_sprite_ext(_left_hand, 0, x - 115, y, 0.5, 0.5, 0, c_white, 1);

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
draw_sprite_ext(_left_hand, 0, x + 115, y, 0.5, 0.5, 0, c_white, 1);