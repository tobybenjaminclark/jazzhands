/// @description Draw Right Hand Symbol in Settings Menu

// Variable for the right hand symbol sprite and its description
var _right_hand = 0;
var _description = "";

// Switch case to determine which right hand symbol and text to display based on global.right_hand
switch(global.right_hand)
{
    case "OPEN_PALM":
        _right_hand = sprSymbolOpenPalmBase;
        _description = "Open Palm";
        break;
    case "CLOSED_FIST":
        _right_hand = sprSymbolClosedFistBase;
        _description = "Closed Fist";
        break;
    case "VICTORY":
        _right_hand = sprSymbolVictoryBase;
        _description = "Victory";
        break;
    case "POINTING_UP":
        _right_hand = sprSymbolPointUpBase;
        _description = "Pointing Up";
        break;
    case "THUMB_DOWN":
        _right_hand = sprSymbolThumbsDownBase;
        _description = "Thumbs Down";
        break;
    case "THUMB_UP":
        _right_hand = sprSymbolThumbsUpBase;
        _description = "Thumbs Up";
        break;
    default:
        _right_hand = sprUnknownSymbol;
        _description = "Unknown";
}

// Draw the label "Right" above the symbol
draw_set_font(fntLevelNameTiny);
draw_set_halign(fa_center);
draw_text(x, y - 70, "Right");

// Draw the right hand sprite in the settings menu
draw_sprite_ext(_right_hand, 0, x, y, 0.6, 0.6, 0, c_white, 1);

// Draw the description text below the symbol
draw_set_font(fntLevelNameTiny); // Use a small font
draw_text(x, y + 50, _description);
