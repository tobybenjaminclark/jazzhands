
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
		image_blend = c_lime;
	} else {
		image_blend = c_red;
	}
	
	move_offs += 2;
	
	if(image_alpha < 0.7) {
		image_alpha += 0.1;
	} else {
		fading_out = true;
	}
}
else if(fading_out){
	if(image_alpha > 0) {
		image_alpha -= 0.01;
	}
	
	move_offs += 2;
	
	if(image_alpha <= 0){
		instance_destroy(self);
	}
}