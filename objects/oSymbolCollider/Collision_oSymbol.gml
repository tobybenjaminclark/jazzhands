/// @description Insert description here
// You can write your code in this editor
//possible_gestures = ["None", "Closed_Fist", "Open_Palm", "Pointing_Up", "Thumb_Down", "Thumb_Up", "Victory", "ILoveYou"]
if(other.alive == false)
{
	return;
}
else if(other.stype == "THUMB_UP")
{
	if((other.side == "LEFT" && global.left_hand == "Thumb_Up") || (other.side == "RIGHT" && global.right_hand = "Thumb_Up"))
	{
		other.alive = false;
		global.points = global.points + 1;
		audio_play_sound(sndBrickHit, 1, false);
		other.image_blend = make_color_rgb(150, 255, 150);
	}
	else
	{
		other.alive = false;
		other.image_blend = make_color_rgb(255, 100, 100); // Set the object's sprite color to a bright red
		audio_play_sound(sndDeath, 1, false);
	}
}

else if(other.stype == "OPEN_HAND")
{
	if((other.side == "LEFT" && global.left_hand == "Open_Palm") || (other.side == "RIGHT" && global.right_hand = "Open_Palm"))
	{
		other.alive = false;
		global.points = global.points + 1;
		audio_play_sound(sndBrickHit, 1, false);
		other.image_blend = make_color_rgb(150, 255, 150);
	}
	else
	{
		other.alive = false;
		other.image_blend = make_color_rgb(255, 100, 100); // Set the object's sprite color to a bright red
		audio_play_sound(sndDeath, 1, false);
	}
}

else if(other.stype == "THUMB_DOWN")
{
	if((other.side == "LEFT" && global.left_hand == "Thumb_Down") || (other.side == "RIGHT" && global.right_hand = "Thumb_Down"))
	{
		other.alive = false;
		global.points = global.points + 1;
		audio_play_sound(sndBrickHit, 1, false);
		other.image_blend = make_color_rgb(150, 255, 150);
	}
	else
	{
		other.alive = false;
		other.image_blend = make_color_rgb(255, 100, 100); // Set the object's sprite color to a bright red
		audio_play_sound(sndDeath, 1, false);
	}
}

else if(other.stype == "VICTORY")
{
	if((other.side == "LEFT" && global.left_hand == "Victory") || (other.side == "RIGHT" && global.right_hand = "Victory"))
	{
		other.alive = false;
		global.points = global.points + 1;
		audio_play_sound(sndBrickHit, 1, false);
		other.image_blend = make_color_rgb(150, 255, 150);
	}
	else
	{
		other.alive = false;
		other.image_blend = make_color_rgb(255, 100, 100); // Set the object's sprite color to a bright red
		audio_play_sound(sndDeath, 1, false);
	}
}

else if(other.stype == "POINTING_UP")
{
	if((other.side == "LEFT" && global.left_hand == "Pointing_Up") || (other.side == "RIGHT" && global.right_hand = "Pointing_Up"))
	{
		other.alive = false;
		global.points = global.points + 1;
		audio_play_sound(sndBrickHit, 1, false);
		other.image_blend = make_color_rgb(150, 255, 150);
	}
	else
	{
		other.alive = false;
		other.image_blend = make_color_rgb(255, 100, 100); // Set the object's sprite color to a bright red
		audio_play_sound(sndDeath, 1, false);
	}
}