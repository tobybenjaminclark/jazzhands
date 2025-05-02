
if(tracking_beat){
	if side == "LEFT" {
		image_xscale = -1;
		x = (room_width div 2) - (400 + move_offs)
		y = 0
	} else {
		image_xscale = 1;
		x = (room_width div 2) + (400 + move_offs)
		y = 0
	}
	
}

if(true && !fading_out){
	if(true) {
		image_blend = c_white;
	} else {
		image_blend = c_white;
	}
	
	move_offs += 0.5;
	
	if(image_alpha < 0.5) {
		image_alpha += 0.1;
	} else {
		fading_out = true;
	}
}
else if(fading_out){
	if(image_alpha > 0) {
		image_alpha -= 0.01;
	}
	
	move_offs += 0.5;
	
	if(image_alpha <= 0){
		instance_destroy(self);
	}
}