/// @description Camera_GetPositionAdjustmentsX_scr(target)
/// @param target

var target = argument0;
var adjustX = 0;
var adjustY = 0;

if(object_is(target, Movable_obj))
{
  //Get movable speed adjustments
  var spd = Movable_GetHSpeed_scr(target);
  adjustX += spd * m_leadSpeedMultiplierHor;
}

if(object_is(target, Entity_obj))
{
  //Adjust based on where the target is facing
  adjustX += target.m_facing * __view_get( e__VW.WView, 0 ) * m_leadFacingViewMultiplier;
}

return adjustX;
