/// @param angle

var angle = argument0;

if(angle >= 0 && angle < 90)
{
  return 1;
}

if(angle > 270 && angle <= 360)
{
  return 1;
}

if(angle > 90 && angle < 270)
{
  return -1;
}

return 0;