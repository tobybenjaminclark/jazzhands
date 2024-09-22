/// @description Draw Right Hand Symbol in Settings Menu

var _right_hand = 0;

// Switch case to determine which right hand symbol to draw based on global.right_hand
switch(global.right_hand)
{
    case "OPEN_PALM":
        _right_hand = sprSymbolOpenPalmBase;
        break;
    case "CLOSED_FIST":
        _right_hand = sprSymbolClosedFistBase;
        break;
    case "VICTORY":
        _right_hand = sprSymbolVictoryBase;
        break;
    case "POINTING_UP":
        _right_hand = sprSymbolPointUpBase;
        break;
    case "THUMB_DOWN":
        _right_hand = sprSymbolThumbsDownBase;
        break;
    case "THUMB_UP":
        _right_hand = sprSymbolThumbsUpBase;
        break;
    default:
        _right_hand = sprUnknownSymbol;
}

// Draw the right hand sprite in the settings menu at the object’s position
draw_sprite_ext(_right_hand, 0, x, y, 1, 1, 0, c_white, 1);
