
/// @description Save JSON to file
/// @author Toby Benjamin Clark
/// @date   18/01/2023
function json_save(saved_data, file_name)
{
    var json_data = json_stringify(saved_data, false);
    var buffer = buffer_create(string_byte_length(json_data), buffer_fixed, 1);
    buffer_write(buffer, buffer_text, json_data);
    buffer_save(buffer, file_name);
    buffer_delete(buffer);
}