// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function str_to_hex_colour(hexString)
{
    // Check if the hex string starts with "#" and remove it
    if string_char_at(hexString, 1) == "#" {
        hexString = string_delete(hexString, 1, 1);
    }

    // Convert the hex string to a decimal color value
   return "$" + hexString;
}