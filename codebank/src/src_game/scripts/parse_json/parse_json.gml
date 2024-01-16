/// @description Function to parse json from a file.
/// @author Toby Benjamin Clark
/// @date   14/01/2023

function json_parse_from_filepath(file_path)
{
	/* Check file exists */
    if (!file_exists(file_path)) return undefined;
   
   /* Load into buffer & convert to string */
    var buffer = buffer_load(file_path);
    var json = buffer_read(buffer, buffer_text);
	
	/* Delete buffer (conserve memory) */
    buffer_delete(buffer);
	
	/* Return Struct/Array JSON */
    var data = json_parse(json);
	if(data == undefined) show_message("Failed to parse JSON at " + file_path);
	return data;
}