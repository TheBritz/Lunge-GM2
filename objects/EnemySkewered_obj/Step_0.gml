/// @description Invert y_scale if facing left
// You can write your code in this editor

//Orient sprite directionally
if(image_angle >= 90 && image_angle <= 270)
{
  image_yscale = -1;
}