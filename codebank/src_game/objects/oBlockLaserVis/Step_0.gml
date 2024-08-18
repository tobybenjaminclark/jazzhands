
if(tracking_beat){
	if twin.side == "LEFT" {
		image_xscale = -1;
		x = (room_width div 2) - (400 + move_offs)
		y = - 200
	} else {
		image_xscale = 1;
		x = (room_width div 2) + (400 + move_offs)
		y = - 200
	}
	
}

if(twin.dead && !fading_out){
	if(twin.hit_this_beat) {
		image_blend = c_white;
	} else {
		image_blend = c_white;
	}
	
	move_offs += 0.5;
	
	if(image_alpha < 0.9) {
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