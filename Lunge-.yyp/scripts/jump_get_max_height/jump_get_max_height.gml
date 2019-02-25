/// @description jump_get_max_height(jumpSpeed, gravity)
/// @param jumpSpeed
/// @param gravity

var jumpSpeed = argument0;
var grav = argument1;

var height = sqr(jumpSpeed) / (2 * grav);

return height;