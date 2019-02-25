/// @description PlayerSpear_SetAngle_scr(spear, angle)
/// @param spear
/// @param  angle

var spear = argument0;
var angle = argument1;
var retVal = undefined;

with(spear)
{
  image_angle = angle;
  if(!is_undefined(m_imbedPointX))
  {
    //Spear is imbedded; rotation will occur from the imbed point
    x = m_imbedPointX + lengthdir_x(-m_imbedPosX, image_angle);
    y = m_imbedPointY + lengthdir_y(-m_imbedPosX, image_angle);  
    retVal = array(x, y);
  }
  
  return retVal;
}
