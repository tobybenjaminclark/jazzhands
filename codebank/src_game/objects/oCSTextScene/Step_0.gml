/// @description Step event to increase the body text currently visible on the screen.
/// @author Amber Swarbrick
/// @date   08/02/2023


// increment the letter to draw
if(floor(show_index) == string_length(body))
{
	return;
}
else
{
	draw_set_font(fntCutsceneText);
	
	if(string_char_at(body, floor(show_index)) == " "){
		show_index += 0.5;	
	}
	else{
		if(floor(show_index) mod 2 == 0) {
			audio_play_sound(snd_metronome, 0, false, random_range(0.0, 0.3), 0, random_range(0.3, 0.8));
		}
		
		show_index += 2;
	}
}
