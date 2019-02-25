/// @description Movable_AddMotion_scr(movable, direction, speed);
/// @param movable
/// @param  direction
/// @param  speed

var movable = argument0;
var dir = argument1;
var spd = argument2;

with(movable)
{
  var hspeedTemp = hspeed;
  var vspeedTemp = vspeed;
  hspeed = m_velocityH;
  vspeed = m_velocityV;
  motion_add(dir, spd);
  m_velocityH = hspeed;
  m_velocityV = vspeed;
  hspeed = hspeedTemp;
  vspeed = vspeedTemp;
}
