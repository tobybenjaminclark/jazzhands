/// @description Function to validate a savefile (https://github.com/tobybenjaminclark/jazzhands/wiki/Savefile-Schema)
/// @author Toby Benjamin Clark
/// @date   16/01/2023

/**
 * Validates the statistics section of a savefile based on the specified schema. (https://github.com/tobybenjaminclark/jazzhands/wiki/Savefile-Schema)
 * @param {object} savefile_struct - The savefile structure to be validated.
 * @param {string} file_path - The path of the savefile for error reporting.
 * @returns {boolean} - Returns true if validation fails, otherwise false.
 * @function
 */
function validate_savefile_statistics(savefile_struct, file_path)
{
    /* Validate Number of Beats Hit */
    if (!variable_struct_exists(savefile_struct, "beats_hit")) display_validation_failure("User " + string(file_path) + " missing attribute `statistics.beats_hit`");
    else if (!validate_real(savefile_struct.beats_hit)) display_validation_failure("User " + string(file_path) + ".statistics.beats_hit cannot be parsed to type `Real` (Number)");

    /* Validate Number of Beats Missed */
    if (!variable_struct_exists(savefile_struct, "beats_missed")) display_validation_failure("User " + string(file_path) + " missing attribute `statistics.beats_missed`");
    else if (!validate_real(savefile_struct.beats_missed)) display_validation_failure("User " + string(file_path) + ".statistics.beats_missed cannot be parsed to type `Real` (Number)");

    /* Validate Number of Songs Played */
    if (!variable_struct_exists(savefile_struct, "songs_played")) display_validation_failure("User " + string(file_path) + " missing attribute `statistics.songs_played`");
    else if (!validate_real(savefile_struct.songs_played)) display_validation_failure("User " + string(file_path) + ".statistics.songs_played cannot be parsed to type `Real` (Number)");
}



/**
 * Validates a savefile structure based on the specified schema. (https://github.com/tobybenjaminclark/jazzhands/wiki/Savefile-Schema)
 * @param {object} savefile_struct - The savefile structure to be validated.
 * @param {string} file_path - The path of the savefile for error reporting.
 * @returns {boolean} - Returns true if validation fails, otherwise false.
 * @function
 */
function validate_savefile(savefile_struct, file_path)
{
    /* Set failure flag to false, this is updated to true in the `display_validation_failure` function. */
    global.validation_failure = false;

    /* Validate Name & ID */
    if (!variable_struct_exists(savefile_struct, "username")) display_validation_failure("User " + string(file_path) + " missing attribute `username`");
    else if (!validate_string(savefile_struct.username)) display_validation_failure("User " + string(file_path) + ".username cannot be parsed to type String");

    /* Validate Hexcode */
    if (!variable_struct_exists(savefile_struct, "hex_code")) display_validation_failure("User " + string(file_path) + " missing attribute `hex_code`");
    else if (!validate_string(savefile_struct.hex_code)) display_validation_failure("User " + string(file_path) + ".hex_code cannot be parsed to type String");

    /* Validate ID */
    if (!variable_struct_exists(savefile_struct, "id")) display_validation_failure("User " + string(file_path) + " missing attribute `username`");
    else if (!validate_real(savefile_struct.id)) display_validation_failure("User " + string(file_path) + ".username cannot be parsed to type `Real` (Number)");

    /* Validating `statistics` exists, and is of type `Struct` */
    if (!variable_struct_exists(savefile_struct, "statistics")) display_validation_failure("User `" + string(file_path) + "` - missing 'statistics' attribute");
    else
	{
        /* Validate `statistics` is of type Struct, and then validate its contents */
        if (!is_struct(savefile_struct.statistics)) display_validation_failure("User " + string(file_path) + ".statistics is not of type `Struct`");
        else validate_savefile_statistics(savefile_struct, file_path);
    }

    return global.validation_failure;
}
