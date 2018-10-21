/// @param distanceToReach
/// @param jumpSpeed
/// @param grav
/// @param horSpeed

var heightToReach = argument0;
var distToReach = argument1;
var grav = argument2;
var horSpeed = argument3;

//Time to target
var timeToTarget = abs(distToReach/horSpeed);

//Get jump height
var jumpHeight;

if(jumpHeight < heightToReach)
{
	return -1;
}

var diff = jumpHeight - heightToReach;
var framesTotal = jump_get_hangtime(jumpSpeed, grav, diff);

var maxReachableDist = horSpeed * framesTotal;
return maxReachableDist;



