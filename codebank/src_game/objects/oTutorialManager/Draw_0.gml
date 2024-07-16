/// @description Insert description here
// You can write your code in this editor

draw_self();

if(tutorial_state == 0 && tutorial_substate == 5){
	draw_sprite(sprHands, 0, 1024, 420);	
}

if(tutorial_state == 0 && tutorial_substate == 6){
	draw_sprite(sprVictory, 0, 1024, 420);	
}