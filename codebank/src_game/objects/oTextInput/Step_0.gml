/// @description Insert description here
// You can write your code in this editor
// Step Event
if (keyboard_check_pressed(vk_anykey))
{
    var key = keyboard_key;
 
    // Check if the key is the backspace key
    if (key == vk_backspace) {
        // Remove the last character from input_text
        if (string_length(input_text) > 0) {
            input_text = string_copy(input_text, 1, string_length(input_text) - 1);
        }
	}
    
	// Check if the key is a letter or a number
    else if ((key >= 65 && key <= 90) || (key >= 97 && key <= 122) || (key >= 48 && key <= 57))
	{
        if(!string_length(input_text) <= MAX_SAVEFILE_NAME_LENGTH)
		{
			input_text += string_lower(chr(key));
		}
		else
		{
			/* Play some sound? */
		}
    }
	global.input_text = input_text;
}
