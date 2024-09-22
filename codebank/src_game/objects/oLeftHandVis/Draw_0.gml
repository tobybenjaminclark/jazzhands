/// @description Draw Left Hand Symbol in Settings Menu

// Variable for the left hand symbol sprite and its description
var _left_hand = 0;
var _description = "";

// Switch case to determine which left hand symbol and text to display based on global.left_hand
switch(global.left_hand)
{
    case "OPEN_PALM":
        _left_hand = sprSymbolOpenPalmBase;
        _description = "Open Palm";
        break;
    case "CLOSED_FIST":
        _left_hand = sprSymbolClosedFistBase;
        _description = "Closed Fist";
        break;
    case "VICTORY":
        _left_hand = sprSymbolVictoryBase;
        _description = "Victory";
        break;
    case "POINTING_UP":
        _left_hand = sprSymbolPointUpBase;
        _description = "Pointing Up";
        break;
    case "THUMB_DOWN":
        _left_hand = sprSymbolThumbsDownBase;
        _description = "Thumbs Down";
        break;
    case "THUMB_UP":
        _left_hand = sprSymbolThumbsUpBase;
        _description = "Thumbs Up";
        break;
    default:
        _left_hand = sprUnknownSymbol;
        _description = "Unknown";
}

// Draw the label "Left" above the symbol
draw_set_font(fntLevelNameTiny);
draw_set_halign(fa_center);
draw_text(x, y - 70, "Left");

// Draw the left hand sprite in the settings menu
draw_sprite_ext(_left_hand, 0, x, y, 0.6, 0.6, 0, c_white, 1);

// Draw the description text below the symbol
draw_set_font(fntLevelNameTiny); // Use a small font
draw_text(x, y + 50, _description);
