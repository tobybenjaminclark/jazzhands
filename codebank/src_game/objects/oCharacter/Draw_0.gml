/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(fntDebug);


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
draw_sprite(_left_hand, 0, x - 100, y);

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
draw_sprite(_left_hand, 0, x + 100, y);
