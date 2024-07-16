/// @description Insert description here
// You can write your code in this editor

if(flash_timer > 0){
	flash_timer--;
	image_blend = flash_color;
}
else{
	image_blend = original_color;
}