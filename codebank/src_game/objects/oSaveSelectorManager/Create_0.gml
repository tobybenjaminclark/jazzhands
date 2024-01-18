/// @description Insert description here
// You can write your code in this editor

for(var i =0; i < array_length(global.saves); i++)
{
	instance_create_layer(x + (128 * i), y, layer, oSaveSelector, {save_index: i});
}







