/// @description Draw Left Hand Symbol in Settings Menu

// No need to check for cutscenes or pauses in the settings
var _left_hand = 0;

// Switch case to determine which left hand symbol to draw based on global.left_hand
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
    case "THUMB_DOWN":
        _left_hand = sprSymbolThumbsDownBase;
        break;
    case "THUMB_UP":
        _left_hand = sprSymbolThumbsUpBase;
        break;
    default:
        _left_hand = sprUnknownSymbol;
}

// Draw the left hand sprite in the settings menu at the object’s position
draw_sprite_ext(_left_hand, 0, x, y, 1, 1, 0, c_white, 1);
