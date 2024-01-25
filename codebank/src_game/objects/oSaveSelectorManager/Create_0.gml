/// @description Insert description here
// You can write your code in this editor

for(var _i = 0; _i < array_length(global.saves); _i++)
{
	
	instance_create_layer(x + (128 * _i), y, layer, oSaveSelector, {save_index: _i});
}







