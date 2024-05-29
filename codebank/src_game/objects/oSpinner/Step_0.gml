/// @description Insert description here
// You can write your code in this editor

if(upwards){
	step++;
	shake_fx = layer_get_fx("ShakeLayer");
	fx_set_parameter(shake_fx, "g_TwistBlurIntensity", 0.1 * modified_logistic_curve(step / 10));
	if(step > 10){
		upwards = false;	
	}
}
else{
	step--;
	shake_fx = layer_get_fx("ShakeLayer");
	fx_set_parameter(shake_fx, "g_TwistBlurIntensity", 0.1 * modified_logistic_curve(step / 10));
	if(step <= 0){
		fx_set_parameter(shake_fx, "g_TwistBlurIntensity", 0);
		instance_destroy(self);
	}
}