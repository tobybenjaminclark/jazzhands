/// @description Validating Beatmap using the Schema Defined (https://github.com/tobybenjaminclark/jazzhands/wiki/Jazzhands-Beatmap-API)
/// @author Toby Benjamin Clark
/// @date   14/01/2023

/**
 * Display a validation failure in a window.
 * @param {string} displayed_string  - String to display.
 */
function display_validation_failure(displayed_string)
{
	show_message("Jazzhands Level Import\nValidation Failure:\n\n" + displayed_string);
	global.validation_failure = true;
}



/**
 * Replaces the last element of a file path with another string.
 * 
 * @param {string} filePath - The original file path.
 * @param {string} newElement - The new element to replace the last one.
 * @return {string} - The modified file path.
 */
function filepath_replace_last_element(file_path, new_element)
{
    /* Splits the string at '/' instances, replaces the final element with the new element */
    return string_replace(file_path, string_split(file_path, "/")[array_length(string_split(file_path, "/")) - 1], new_element);
}



/** 
 * Validate if a string is in a list
 * @param {string} str - The string to be validated.
 * @param {array} stringList - The list of strings to check against.
 * @return {bool} Returns true if the string is in the list, false otherwise.
 */
function validate_string_in_list(target, string_list)
{	
    var list_length = array_length(string_list)
    for (var i = 0; i < list_length; ++i)
    {
		/* String has been found in list */
        if (string_list[i] == target) return true;
		else continue;
    }

    /* String not in list */
    return false;
}



/**
 * Validate a target variable is of type real
 * @param {string} target     - Variable to test
 * @return {bool}             - True if can be parsed, False if not.
 */
function validate_real(target)
{
	/* Try and parse the target as type `real` */
	try {real(target)}
	catch(e){return false;}
	
	/* If it worked, then true, else return false */
	return true;
}



/**
 * Validate a target variable is of type string
 * @param {string} target     - Variable to ttest
 * @return {bool}             - True if can be parsed, False if not.
 */
function validate_string(target)
{
	/* Try and parse the target as type `real` */
	try {string(target)}
	catch(e){return false;}
	
	/* If it worked, then true, else return false */
	return true;
}



/**
 * Validate a level_data object based on the provided Beatmap API documentation. (https://github.com/tobybenjaminclark/jazzhands/wiki/Jazzhands-Beatmap-API)
 * @param {struct} level_data  - Provided Level Data Structure
 * @param {string} file_path   - File Path to current level
 *
 */
function validate_level_data(level_data, file_path)
{
	/* Validate `.level_name` attribute exists, and is of type string */
    if(!variable_struct_exists(level_data, "level_name")) display_validation_failure("Level `" + string(file_path) + ".leveldata - missing 'level_name' attribute");
	else if(!validate_string(level_data.level_name)) display_validation_failure("Level " + string(file_path) + " leveldata.level_name cannot be parsed to type `String`");
	
	/* Validate `.description` attribute exists, and is of type string */
    if(!variable_struct_exists(level_data, "description")) display_validation_failure("Level `" + string(file_path) + ".leveldata - missing 'description' attribute");
	else if(!validate_string(level_data.description)) display_validation_failure("Level " + string(file_path) + " leveldata.description cannot be parsed to type `String`");
	
	/* Validate `.background` attribute exists, and is of type string */
    if(!variable_struct_exists(level_data, "background")) display_validation_failure("Level `" + string(file_path) + ".leveldata - missing 'background' attribute");
	else if(!validate_string(level_data.background)) display_validation_failure("Level " + string(file_path) + " leveldata.background cannot be parsed to type `String`");
	
	/* Validate `.song` attribute exists */
    if(!variable_struct_exists(level_data, "song")) display_validation_failure("Level `" + string(file_path) + ".leveldata - missing 'song' attribute");
	{
		/* Validate that `.song` is of type string, and the file exists. */
		if(!validate_string(level_data.song)) display_validation_failure("Level " + string(file_path) + " leveldata.song cannot be parsed to type `String`");
		else if(!file_exists(string(filepath_replace_last_element(file_path, level_data.song)))) display_validation_failure("Level " + string(file_path) + " Missing Resource: " + string(filepath_replace_last_element(file_path, level_data.song)));
	
		/* TODO: Add format validation */
	}
}



/**
 * Validate beatdata for `hold` event based on the provided Beatmap API documentation. (https://github.com/tobybenjaminclark/jazzhands/wiki/Jazzhands-Beatmap-API)
 * @param {struct} event      - Struct of current hold event
 * @param {string} file_path  - File path of the beatmap (used for error messages)
 * @param {int} event_index   - Index of the current event (used for error messages)
 */
function validate_event_beat(event, file_path, event_index)
{
	/* Validate `time` attribute exists & can be parsed to `real`. */
	if(!variable_struct_exists(event.event_data, "time")) display_validation_failure("Event " + string(event_index) + " beatdata (`beat`) missing attribute `time`");
	else if(!validate_real(event.event_data.time)) display_validation_failure("Event " + string(event_index) + " beatdata.time cannot be parsed to type `Real` (Int)");


	/* Validating that the `symbol` attribute is of type string, and is in JS_SYMBOL_LIST (see macros) */
	if(!variable_struct_exists(event.event_data, "symbol")) display_validation_failure("Event " + string(event_index) + " beatdata (`beat`) missing attribute `symbol`");
	else
	{
		if(!validate_string(event.event_data.symbol)) display_validation_failure("Event " + string(event_index) + " beatdata.symbol cannot be parsed to type `String`");
		else if(!validate_string_in_list(event.event_data.symbol, JS_SYMBOL_LIST)) display_validation_failure("Event " + string(event_index) + " beatdata.symbol not in symbol list");
	}
			
	/* Validating that the `side` attribute is of type string, and is in JS_SIDE_LIST (see macros) */
	if(!variable_struct_exists(event.event_data, "side")) display_validation_failure("Event " + string(event_index) + " beatdata (`beat`) missing attribute `side`");
	else
	{
		if(!validate_string(event.event_data.side)) display_validation_failure("Event " + string(event_index) + " beatdata.symbol cannot be parsed to type `String`");
		else if(!validate_string_in_list(event.event_data.side, JS_SIDE_LIST)) display_validation_failure("Event " + string(event_index) + " beatdata.symbol not in symbol list");
	}	
}



/**
 * Validate beatdata for `beat` event based on the provided Beatmap API documentation. (https://github.com/tobybenjaminclark/jazzhands/wiki/Jazzhands-Beatmap-API)
 * @param {struct} event      - Struct of current event
 * @param {string} file_path  - File path of the beatmap (used for error messages)
 * @param {int} event_index   - Index of the current event (used for error messages)
 */
function validate_event_hold(event, file_path, event_index)
{
	/* Validate `start_time` attribute exists & can be parsed to `real`. */
	if(!variable_struct_exists(event.event_data, "start_time")) display_validation_failure("Event " + string(event_index) + " beatdata (`hold`) missing attribute `start_time`");
	else if(!validate_real(event.event_data.start_time)) display_validation_failure("Event " + string(event_index) + " beatdata.start_time cannot be parsed to type `Real` (Int)");

	/* Validate `end_time` attribute exists & can be parsed to `real`. */
	if(!variable_struct_exists(event.event_data, "end_time")) display_validation_failure("Event " + string(event_index) + " beatdata (`hold`) missing attribute `end_time`");
	else if(!validate_real(event.event_data.end_time)) display_validation_failure("Event " + string(event_index) + " beatdata.end_time cannot be parsed to type `Real` (Int)");


	/* Validating that the `symbol` attribute is of type string, and is in JS_SYMBOL_LIST (see macros) */
	if(!variable_struct_exists(event.event_data, "symbol")) display_validation_failure("Event " + string(event_index) + " beatdata (`hold`) missing attribute `symbol`");
	else
	{
		if(!validate_string(event.event_data.symbol)) display_validation_failure("Event " + string(event_index) + " beatdata.symbol cannot be parsed to type `String`");
		else if(!validate_string_in_list(event.event_data.symbol, JS_SYMBOL_LIST)) display_validation_failure("Event " + string(event_index) + " beatdata.symbol not in symbol list");
	}
			
	/* Validating that the `side` attribute is of type string, and is in JS_SIDE_LIST (see macros) */
	if(!variable_struct_exists(event.event_data, "side")) display_validation_failure("Event " + string(event_index) + " beatdata (`hold`) missing attribute `side`");
	else
	{
		if(!validate_string(event.event_data.side)) display_validation_failure("Event " + string(event_index) + " beatdata.symbol cannot be parsed to type `String`");
		else if(!validate_string_in_list(event.event_data.side, JS_SIDE_LIST)) display_validation_failure("Event " + string(event_index) + " beatdata.symbol not in symbol list");
	}	
}



/**
 * Validates event data based on the provided Beatmap API documentation. (https://github.com/tobybenjaminclark/jazzhands/wiki/Jazzhands-Beatmap-API)
 * @param {object} event      - The event object.
 * @param {string} file_path  - The path to the beatmap file being validated.
 * @param {int} event_index   - Index of the current event.
 */
function validate_event_data(event, file_path, event_index)
{
    switch(event.event_type)
    {	
        /* Validating `beat` event_type */
        case "beat":
			validate_event_beat(event, file_path, event_index)
        break;
					
		/* Validating `bad_beat` event type. (This is semantically identical to `beat` event type. */			
        case "bad_beat":
            validate_event_beat(event, file_path, event_index)
        break;
						
		case "hold":
			validate_event_hold(event, file_path, event_index)
        default:
            /* Add validation for other event types if needed */
            break;
    }
}



/**
 * Validates each event in the beatmap based on the provided Beatmap API documentation. (https://github.com/tobybenjaminclark/jazzhands/wiki/Jazzhands-Beatmap-API)
 * @param {object} event      - The event object to be validated.
 * @param {string} file_path  - The path to the beatmap file being validated
 * @param {int} event_index   - The index of the current event
 */
function validate_event(event, file_path, event_index)
{
	/* Validating Event `.event_data` exists & is of type struct.  */
    if(!variable_struct_exists(event, "event_data")) display_validation_failure("Event " + string(event_index) + " missing attribute `event_data`");
	else if(!is_struct(event.event_data)) display_validation_failure("Event " + string(event_index) + ".event_data is not of type `Struct`");
	
	/* Validating Event `.event_type` exists and is of type string.*/
    if(!variable_struct_exists(event, "event_type")) display_validation_failure("Event " + string(event_index) + " missing attribute `event_type`");
	else if(!validate_string(event.event_type)) display_validation_failure("Event " + string(event_index) + ".event_type cannot be parsed to type `String`");
				
    /* Validating Event `.event_data` properties dependent on Event `.event_type` */
    else validate_event_data(event, file_path, event_index);
}



/**
 * Validates the entire beatmap schema based on the provided Beatmap API documentation. (https://github.com/tobybenjaminclark/jazzhands/wiki/Jazzhands-Beatmap-API)
 * @param {struct} level_map   The beatmap object to be validated.
 * @param {string} file_path  - The path to the beatmap file being validated.
 */
function validate_beatmap(level_map, file_path)
{
	/* Set failure flag to false, this is updated to true in the `display_validation_failure` function. */
	global.validation_failure = false;
	 
    /* Validating Level Data exists, and is of type `Struct` */
    if(!variable_struct_exists(level_map, "level_data")) display_validation_failure("Level `" + string(file_path) + "` - missing 'level_data' attribute");
	else
	{
		/* Validate level_data is of type Struct, and then validate its contents */
		if(!is_struct(level_map.level_data)) display_validation_failure("Level " + string(file_path) + ".level_data is not of type `Struct`");
		else validate_level_data(level_map.level_data, file_path);
    
	}
	
	/* Validating Events exists */
    if(!variable_struct_exists(level_map, "events")) display_validation_failure("Level `" + string(file_path) + "` - missing 'events' attribute");
	else
	{
		/* Validating Events */
	    var events = level_map.events;
	    if(!is_array(events)) display_validation_failure("Level `" + string(file_path) + "` - is not of type `Array`");
	    else
	    {
	        /* Iterating through & validating each event */
	        for(var event_index = 0; event_index < array_length(events); event_index++) validate_event(events[event_index], file_path, event_index);
	    }	
	}

	
	return !global.validation_failure;
}
