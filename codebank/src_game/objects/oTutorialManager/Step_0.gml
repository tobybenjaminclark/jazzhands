/// @description Insert description here
// You can write your code in this editor


/* Double open palm for this */
if(tutorial_state == 0 && tutorial_substate == 5){
	if(global.left_hand == "OPEN_PALM" && global.right_hand == "OPEN_PALM") {
		tutorial_substate = 6;
		text_object = instance_create_layer(x, y, "Instances", oScreenText, {heading: "Mojo", body: "Great job!"})
	}
}