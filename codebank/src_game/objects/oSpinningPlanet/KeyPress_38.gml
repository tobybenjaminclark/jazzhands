/// @description Move Moons
/// @author Toby Benjamin Clark
/// @date   18/02/24

if(is_stopper && start_angle < 0)
{
	audio_play_sound(snd_ping_gentle, 0, false);
	dir = "UP";
	start_angle += 1;
}