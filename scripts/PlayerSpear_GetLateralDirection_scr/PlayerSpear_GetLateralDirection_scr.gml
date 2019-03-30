var spear = argument0;

with(spear)
{
  if(image_angle == 90 || image_angle == 270)
  {
    //Neutral
    return 0;
  }
  else if(image_angle > 90 && image_angle < 270)
  {
    //Left
    return -1;
  }
  else
  {
    //Right
    return 1;
  }
}