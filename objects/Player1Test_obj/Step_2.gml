/// @description Position spear on self

m_spear.x = x;
m_spear.y = y;
m_spear.depth = depth - 1;

var spearAngle = 0;
if(keyboard_check(vk_left) && !keyboard_check(vk_right))
{
  if(keyboard_check(vk_up))
  {
    spearAngle = 135; 
  }
  else if(keyboard_check(vk_down))
  {
    spearAngle = 225;
  }
  else
  {
    spearAngle = 180;
  }
}
else if(keyboard_check(vk_right) && !keyboard_check(vk_left))
{
  if(keyboard_check(vk_up))
  {
    spearAngle = 45; 
  }
  else if(keyboard_check(vk_down))
  {
    spearAngle = 315;
  }
  else
  {
    spearAngle = 0;
  }
}
else if(keyboard_check(vk_down) && !keyboard_check(vk_up))
{
  spearAngle = 270;
}
else if(keyboard_check(vk_up) && !keyboard_check(vk_down))
{
  spearAngle = 90;
}

m_spear.image_angle = spearAngle

