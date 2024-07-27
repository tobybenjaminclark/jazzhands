/// @description Insert description here
// You can write your code in this editor

/* Increment current step */
current_step++;

/* increment display step (if u can) */
if(current_step % 50 == 0){
	display_step += 1;	
}

/* iAccuracy (integer accuracy) */
if(display_step >= 4){
	if(iaccuracy_display < iaccuracy && current_step % 3 == 0){
		iaccuracy_display += 1;
	}
}