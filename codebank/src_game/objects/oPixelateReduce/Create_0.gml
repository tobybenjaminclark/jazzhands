// Initialize variables
initial_pixel_size = 100;
final_pixel_size = 1;
current_pixel_size = initial_pixel_size;
steps = 100;
step_count = 0;

// Get the effect for the PixelateLayer
pixelate_fx = layer_get_fx("PixelateLayer");

// Set the initial pixel size
fx_set_parameter(pixelate_fx, "g_CellSize", initial_pixel_size);
