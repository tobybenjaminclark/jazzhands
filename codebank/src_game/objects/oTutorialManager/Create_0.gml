/// @description Insert description here
// You can write your code in this editor

/* States
 * 0 - Introduction
 * 1 - Symbol Smashing
 */



tutorial_state = 0;
tutorial_substate = 0;

/* Transition into State 0 */
text_object = instance_create_layer(x, y, "Instances", oScreenText, {heading: "Mojo", body: "Welcome to Jazzhands! The rhythm game with no buttons, no sticks, just straight-up hand gestures and groove, ya feel me?"})