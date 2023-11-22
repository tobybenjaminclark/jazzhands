// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bgm_play(){
	audio_stop_all();
	switch(room)
	{
		case rmMainMenu:
			bg = audio_play_sound(sndCluster, 1, true);
			break;
		case rmTechnoLevelNavigator:
			bg = audio_play_sound(sndInspect, 1, true);
			break;
	}
}