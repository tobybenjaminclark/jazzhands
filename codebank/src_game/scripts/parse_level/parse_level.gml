// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function parse_level()
{
    // Create a ds_map to store the parsed JSON data
    var json_map = ds_map_create();

    // Specify the file path of your JSON file
    var file_path = "tutorial.json";

    // Check if the file exists
    if (file_exists(file_path))
    {
        // Read the entire content of the file as a string
        var file_buffer = buffer_load(file_path);
		var json_string = buffer_read(file_buffer, buffer_string);
		
		show_debug_message(json_string);

        // Close the file
        buffer_delete(file_buffer);

        // Parse the JSON string into a ds_map
        json_map = json_decode(json_string);

        // Check if the decoding was successful
        if (json_map != undefined)
        {
            // Recursively display the contents of the ds_map
            show_debug_message(json_encode(json_map));
        }
        else
        {
            show_message("Failed to decode JSON");
        }
    }
    else
    {
        show_message("File not found: " + file_path);
    }

    // Destroy the ds_map to free up memory
    ds_map_destroy(json_map);
}