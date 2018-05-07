/// @description Movable_ChangeHSpeed_scr(targetSpeed, acceleration)
/// @param targetSpeed
/// @param  acceleration

var targetSpeed = argument[0];
var acceleration = undefined;
if(argument_count > 1) 
  var acceleration = argument[1];

if(!is_undefined(acceleration))
{
  if (m_velocityH < targetSpeed)
      m_velocityH = min(m_velocityH + acceleration, targetSpeed); 
  else
      m_velocityH = max(m_velocityH - acceleration, targetSpeed);
}
else
{
  m_velocityH = targetSpeed;
}
