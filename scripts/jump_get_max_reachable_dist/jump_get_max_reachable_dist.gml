/// @param heightToReach
/// @param jumpSpeed
/// @param grav
/// @param horSpeed

var heightToReach = argument0;
var jumpSpeed = argument1;
var grav = argument2;
var horSpeed = argument3;

//Get jump height
var jumpHeight;

if(jumpHeight < heightToReach)
{
	return -1;
}

var diff = jumpHeight - heightToReach;
var framesFallToHeight = sqrt((2*diff)/g);

var framesToPeak = jump_get_frames_to_reach_peak(jumpSpeed, grav);

var framesTotal = framesToPeak + framesFallToHeight;

var maxReachableDist = horSpeed * framesTotal;
return maxReachableDist;



