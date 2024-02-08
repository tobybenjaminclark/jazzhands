/// @description Step event to increase the body text currently visible on the screen.
/// @author Amber Swarbrick
/// @date   08/02/2023


// increment the letter to draw
if(text_index == string_length(body))
{
	return;
}
text_index+=0.5;