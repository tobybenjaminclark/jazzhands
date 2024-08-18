
if(tracking_beat){
	if twin.side == "LEFT" {
		x = (room_width div 2) - 600
		y = room_height div 2
	} else {
		x = (room_width div 2) + 600
		y = room_height div 2
	}
	
}

if(twin.dead && !fading_out){
	if(twin.hit_this_beat) {
		sprite_index = sprHappyTiki;
		image_blend = c_lime;
	} else {
		sprite_index = sprAngryTiki;
		image_blend = c_red;
	}
	
	if(image_xscale < 0.5) {
		image_xscale += 0.05;
		image_yscale += 0.05;
	}
	
	if(image_alpha < 0.8) {
		image_alpha += 0.1;
	} else {
		fading_out = true;
	}
}
else if(fading_out){
	
	if(image_xscale < 0.5) {
		image_xscale += 0.05;
		image_yscale += 0.05;
	}
	
	y = y - lift_speed;
	lift_speed = lift_speed + 2;
	
	if(image_alpha > 0) {
		image_alpha -= 0.01;
	}
	
	if(image_alpha <= 0){
		instance_destroy(self);
	}
}