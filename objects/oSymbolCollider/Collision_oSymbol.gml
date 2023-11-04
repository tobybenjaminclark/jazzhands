/// @description Insert description here
// You can write your code in this editor
if(other.stype == "THUMB_UP")
{
	if((other.side == "LEFT" && global.left_hand == "THUMB_UP") || (other.side == "RIGHT" && global.right_hand = "THUMB_UP"))
	{
		global.points = global.points + 1;
		audio_play_sound(sndBrickHit, 1, false);
		instance_destroy(other);
	}
	else
	{
		audio_play_sound(sndDeath, 1, false);
		instance_destroy(other);
	}
}

else if(other.stype == "OPEN_HAND")
{
	if((other.side == "LEFT" && global.left_hand == "OPEN_HAND") || (other.side == "RIGHT" && global.right_hand = "OPEN_HAND"))
	{
		global.points = global.points + 1;
		audio_play_sound(sndBrickHit, 1, false);
		instance_destroy(other);
	}
	else
	{
		audio_play_sound(sndDeath, 1, false);
		instance_destroy(other);
	}
}

else if(other.stype == "THUMB_DOWN")
{
	if((other.side == "LEFT" && global.left_hand == "THUMB_DOWN") || (other.side == "RIGHT" && global.right_hand = "THUMB_DOWN"))
	{
		global.points = global.points + 1;
		audio_play_sound(sndBrickHit, 1, false);
		instance_destroy(other);
	}
	else
	{
		audio_play_sound(sndDeath, 1, false);
		instance_destroy(other);
	}
}

else if(other.stype == "VICTORY")
{
	if((other.side == "LEFT" && global.left_hand == "VICTORY") || (other.side == "RIGHT" && global.right_hand = "VICTORY"))
	{
		global.points = global.points + 1;
		audio_play_sound(sndBrickHit, 1, false);
		instance_destroy(other);
	}
	else
	{
		audio_play_sound(sndDeath, 1, false);
		instance_destroy(other);
	}
}

else if(other.stype == "POINTING_UP")
{
	if((other.side == "LEFT" && global.left_hand == "POINTING_UP") || (other.side == "RIGHT" && global.right_hand = "POINTING_UP"))
	{
		global.points = global.points + 1;
		audio_play_sound(sndBrickHit, 1, false);
		instance_destroy(other);
	}
	else
	{
		audio_play_sound(sndDeath, 1, false);
		instance_destroy(other);
	}
}