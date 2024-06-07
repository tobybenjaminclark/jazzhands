// Check if we have completed the reduction

current_pixel_size--;

if(current_pixel_size < 1){
	current_pixel_size = 1;	
}

fx_set_parameter(pixelate_fx, "g_CellSize", current_pixel_size);