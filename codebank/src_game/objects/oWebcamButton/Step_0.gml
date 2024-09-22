/// @description Insert description here
// You can write your code in this editor

if (mouse_check_button_pressed(mb_left)) {
    // Check if the mouse is over the button
    if (point_in_rectangle(mouse_x, mouse_y, x, y, x + 300, y + 70)) {
        // Handle button click
        // show_message("Selected camera: " + string(name));
		global.chosen_camera = name;
		
		// send reply to server
		camera_msg = {camera:name};
		send_to_server(camera_msg);
    }
}