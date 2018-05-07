/// @description Camera_GetPositionAdjustmentsY_scr(target)
/// @param target

var target = argument0;
var adjustY = 0;

if(object_is(target, Movable_obj))
{
  //Get movable speed adjustments
  var spd = Movable_GetVSpeed_scr(target);
  adjustY += spd * m_leadSpeedMultiplierVert;
}

if(object_is(target, Entity_obj))
{
  //Adjust based on where the target is facing
  adjustY += __view_get( e__VW.HView, 0 ) * m_verticalAdjustMultiplier;
}

return adjustY;
