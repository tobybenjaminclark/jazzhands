/// @description Insert description here
// You can write your code in this editor

switch(tutorial_state){
	case 0:
		switch(tutorial_substate){
			case 0:
				instance_destroy(text_object);
				text_object = instance_create_layer(x, y, "Instances", oScreenText, {heading: "Mojo", body: "Welcome to Jazzhands! The rhythm game with no buttons, no sticks, just straight-up hand gestures and groove, ya feel me?"})
				tutorial_substate = 1;
				break;
			case 1:
				instance_destroy(text_object);
				text_object = instance_create_layer(x, y, "Instances", oScreenText, {heading: "Mojo", body: "The game works using computer vision on your device's camera - make sure your spot's clean and clear, and the webcam got a good view of you and your hands."})
				tutorial_substate = 2;
				break;
			case 2:
				instance_destroy(text_object);
				text_object = instance_create_layer(x, y, "Instances", oScreenText, {heading: "Mojo", body: "If you wanna make this work the best, wear somethin' simple and keep your background plain and well-lit. Ain't nobody tryna see all that extra clutter..."})
				tutorial_substate = 3;
				break;
			case 3:
				instance_destroy(text_object);
				text_object = instance_create_layer(x, y, "Instances", oScreenText, {heading: "Mojo", body: "The beatdeck will project what gesture it thinks each hand is throwing, try to keep 'em up at head height, about shoulders-width apart and in plain view."})
				tutorial_substate = 4;
				break;
			case 4:
				instance_destroy(text_object);
				text_object = instance_create_layer(x, y, "Instances", oScreenText, {heading: "Mojo", body: "This newfound technology can be touchy, so stay cool and patient with it. Once you got the flow, you'll be rollin' solo like a boss in no time! let's get this show on the road! Throw up both hands, keep 'em shoulder-width apart, palms open and facing the camera."})
				tutorial_substate = 5;
				break;
			case 6:
				instance_destroy(text_object);
				text_object = instance_create_layer(x, y, "Instances", oScreenText, {heading: "Mojo", body: "Great job!"})
				tutorial_substate = 7;
				break;
				
			default:
				break;
		}
		break;
	default:
		break;
}