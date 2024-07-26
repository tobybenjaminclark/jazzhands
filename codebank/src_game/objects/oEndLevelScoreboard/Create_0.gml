/// @description Insert description here
// You can write your code in this editor

/* Log current step */
current_step = 0;
pass_accuracy = 60;

display_step = 0;

/* Calculate accuracy etc... determine if the player won or failed? */
accuracy = global.hit_beats / global.total_beats; 
iaccuracy = round(accuracy * 100) * 5

iaccuracy_display = 0;

audio_play_sound(level_win, 1, false);
width = 0;
height = 0;