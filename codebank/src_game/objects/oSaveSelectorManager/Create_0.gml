/// @description Insert description here
// You can write your code in this editor
var totalInstances = array_length(global.saves);
var totalWidth = totalInstances * 256; // Assuming each instance has a width of 256

// Calculate the starting position to center the instances
var startX = (x - totalWidth / 2) + 128;

for(var _i = 0; _i < totalInstances; _i++)
{
    instance_create_layer(startX + (256 * _i), y, layer, oSaveSelector, {save_index: _i});
}

