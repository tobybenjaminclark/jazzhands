/// @description Functional Interface to validate a leaderboard file. (https://github.com/tobybenjaminclark/jazzhands/wiki/Leaderboard-Schema)
/// @author Toby Benjamin Clark
/// @date   16/01/2023



/**
 * Validates a single record entry in a leaderboard based on the specified schema. (https://github.com/tobybenjaminclark/jazzhands/wiki/Leaderboard-Schema)
 * @param {object} record_struct - The record structure to be validated.
 * @param {string} file_path - The path of the leaderboard file for error reporting.
 * @param {number} record_index - The index of the record in the leaderboard.
 * @returns {void}
 */
function validate_record(record_struct, file_path, record_index)
{
    /* Validate ID */
    if (!variable_struct_exists(record_struct, "id")) display_validation_failure("Leaderboard " + string(file_path) + ", record{" + string(record_index) + "} missing attribute `id`");
    else if (!validate_real(record_struct.id)) display_validation_failure("Leaderboard " + string(file_path) + ", record{" + string(record_index) + "} id cannot be parsed to type `Real` (Number)");

    /* Validate Number of Beats Hit */
    if (!variable_struct_exists(record_struct, "beats_hit")) display_validation_failure("Leaderboard " + string(file_path) + ", record{" + string(record_index) + "} missing attribute `beats_hit`");
    else if (!validate_real(record_struct.beats_hit)) display_validation_failure("Leaderboard " + string(file_path) + ", record{" + string(record_index) + "}. beats_hit cannot be parsed to type `Real` (Number)");

    /* Validate Number of Beats Missed */
    if (!variable_struct_exists(record_struct, "beats_missed")) display_validation_failure("Leaderboard " + string(file_path) + ", record{" + string(record_index) + "} missing attribute `beats_missed`");
    else if (!validate_real(record_struct.beats_missed)) display_validation_failure("Leaderboard " + string(file_path) + ", record{" + string(record_index) + "} beats_missed cannot be parsed to type `Real` (Number)");

    /* Validate Score */
    if (!variable_struct_exists(record_struct, "score")) display_validation_failure("Leaderboard " + string(file_path) + ", record{" + string(record_index) + "} missing attribute `score`");
    else if (!validate_real(record_struct.score)) display_validation_failure("Leaderboard " + string(file_path) + ", record{" + string(record_index) + "} score cannot be parsed to type `Real` (Number)");
}



/**
 * Validates a leaderboard structure based on the specified schema. (https://github.com/tobybenjaminclark/jazzhands/wiki/Leaderboard-Schema)
 * @param {object} leaderboard_struct - The leaderboard structure to be validated.
 * @param {string} file_path - The path of the leaderboard file for error reporting.
 * @returns {boolean} - Returns true if validation fails, otherwise false.
 */
function validate_leaderboard(leaderboard_struct, file_path)
{
    global.validation_failure = false;

    /* Validating `Records` exists */
    if (!variable_struct_exists(leaderboard_struct, "records")) display_validation_failure("Leaderboard `" + string(file_path) + "` - missing 'records' array attribute");
    else
	{
        /* Validating Records */
        var records = leaderboard_struct.records;
        if (!is_array(records)) display_validation_failure("Leaderboard.records at `" + string(file_path) + "` - is not of type `Array`");
        else for (var record_index = 0; record_index < array_length(records); record_index++) validate_record(records[record_index], file_path, record_index);

    }

    return !global.validation_failure;
}
