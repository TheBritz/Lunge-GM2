/// @description Movable_GetSpeed_scr(movableInstance)
/// @param movableInstance
var movable = argument0;

with(movable)
{
  var tempHSpeed = hspeed;
  var tempVSpeed = vspeed;
  
  hspeed = m_velocityH;
  vspeed = m_velocityV;
  
  var spd = speed;
  
  hspeed = tempHSpeed;
  vspeed = tempVSpeed;
  
  return spd;
}
