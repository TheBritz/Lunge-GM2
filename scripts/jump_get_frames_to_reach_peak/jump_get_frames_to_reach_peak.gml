/// @description jump_get_frames_to_reach_peak(jumpSpeed, grav)
/// @param  jumpSpeed
/// @param  grav

var jumpSpeed = argument0;
var grav = argument1;

var frames = floor(jumpSpeed / grav);
return abs(frames); 