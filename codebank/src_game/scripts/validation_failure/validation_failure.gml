/// @description Function to display validation failure.
/// @author Toby Benjamin Clark
/// @date   16/01/2023

/**
 * Display a validation failure in a window.
 * @param {string} displayed_string  - String to display.
 */
function display_validation_failure(displayed_string)
{
	show_message("Jazzhands Level Import\nValidation Failure:\n\n" + displayed_string);
	global.validation_failure = true;
}