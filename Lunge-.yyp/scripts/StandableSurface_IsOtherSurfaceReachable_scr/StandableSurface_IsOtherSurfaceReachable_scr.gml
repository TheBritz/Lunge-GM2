/// @description StandableSurface_IsOtherSurfaceReachable_scr(standableInstance, standableInstanceToReach, combatant)
/// @param standableInstance
/// @param standableInstanceToReach
/// @param combatant

var standableStart = argument0;
var standableDestination = argument1;
var combatant = argument2;

var height = standableDestination.bbox_top - standableStart.bbox_top;

with(combatant)
{
  var maxDist =  jump_get_max_reachable_dist
    (height, m_movementGroundJumpSpeed, global.Gravity, m_movementGroundMaxSpeed);
}
