/// @param hangtime
/// @param gravity
/// @param landingHeightDifferential[optional]

var hangtime = abs(argument[0]);
var grav = argument[1];

var landingDiff = 0;
if(argument_count > 2)
{
  landingDiff = argument[2];
}

//Simple implementation right now... will probably have to use quadratic
//equation to get landingDifference to work properly
var ascendTime = round(hangtime/2);

var jumpSpeed = ascendTime * grav;

return jumpSpeed;

