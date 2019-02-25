/// @description move_outside_solid_with_mask(direction, maxDist, maskIndex)
/// @param direction
/// @param  maxDist
/// @param  maskIndex
var dir = argument0;
var maxDist = argument1;
var mask = argument2;

var maskOld = mask_index;
mask_index = mask;
move_outside_solid(dir, speed);
mask_index = maskOld;

if(place_free(x, y))
{
  var test = "test";
}
