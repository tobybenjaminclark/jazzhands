/// @description Insert description here
// You can write your code in this editor

/* Check for post cutscene */
has_played_post_cutscene = false;
has_post_cutscene = false;
post_cutscene_path = "";
if parent.has_post_cutscene {
	has_post_cutscene = true;
	post_cutscene_path = parent.post_cutscene_path;
}

/* Log current step */
bg_alpha = 0;
current_step = 0;
pass_accuracy = 0.60;
has_played_end_accuracy_seq = false;
display_step = -1;

/* Calculate accuracy etc... determine if the player won or failed? */
accuracy = global.hit_beats / global.total_beats; 
iaccuracy = round(accuracy * 100);

iaccuracy_display = 0;

audio_play_sound(level_win, 1, false);
width = 0;
height = 0;