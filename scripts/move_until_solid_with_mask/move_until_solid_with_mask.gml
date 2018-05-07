/// @description move_until_solid_with_mask(xStart, yStart, xEnd, yEnd, increment, maskIndex)
/// @param xStart
/// @param  yStart
/// @param  xEnd
/// @param  yEnd
/// @param  increment
/// @param  maskIndex

var xStart = argument0;
var yStart = argument1;
var xEnd = argument2;
var yEnd = argument3;
var inc = argument4;
var mask = argument5;

var maskOld = mask_index;
mask_index = mask;
move_until_solid(xStart, yStart, xEnd, yEnd, inc);
mask_index = maskOld;
