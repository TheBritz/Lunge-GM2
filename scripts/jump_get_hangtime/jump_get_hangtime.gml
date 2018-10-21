/// @param  jumpSpeed
/// @param  gravity
/// @param  landingHeightDifference[optional]

var jumpSpeed = argument[0];
var grav = argument[1];
var landingDiff = 0;
if(argument_count > 2)
{
   landingDiff = argument[2]; 
}

var ascendFrames = jump_get_frames_to_reach_peak(jumpSpeed, grav);

var height = jump_get_max_height(jumpSpeed, grav);

height += landingDiff;

var descendFrames = jump_get_frames_to_fall_distance(height, grav);

return ascendFrames + descendFrames;