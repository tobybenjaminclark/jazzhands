// Function to create buttons for each camera
function create_camera_buttons() {
    // Clear previous buttons
    for (var i = 0; i < instance_number(oWebcamButton); i++) {
        var button = instance_nearest(mouse_x, mouse_y, oWebcamButton);
        if (button != noone) {
            instance_destroy(button);
        }
    }

    // Create new buttons
    for (var i = 0; i < array_length(global.cameras); i++) {
        var camera = global.cameras[i];
        var button = instance_create_layer(x, y + (i * 50), "Instances", oWebcamButton);
		
		if(variable_struct_exists(camera, "name"))
		{
			button.name = camera.name; // Set the button's name or label
		};
		
		if(variable_struct_exists(camera, "cam_id"))
		{
			button.cam_id = camera.cam_id; // Optionally store the camera id
		};
       
        
    }
}

create_camera_buttons();
