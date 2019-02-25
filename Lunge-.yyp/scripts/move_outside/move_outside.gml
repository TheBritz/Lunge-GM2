/// @description move_outside(obj, dir, maxdist)
/// @param obj
/// @param  dir
/// @param  maxdist

var objectInstance = argument0;
var dir = argument1;
var maxDist = abs(argument2);
var granularity = .1;

repeat(maxDist)
{
  if (place_meeting(x, y, objectInstance))
  {
    x += lengthdir_x(1, dir);
    y += lengthdir_y(1, dir); 
  }
  else
  {
    /*repeat(maxDist)
    {
      x += lengthdir_x(granularity, dir + 180);
      y += lengthdir_y(granularity, dir + 180);
      if(place_meeting(x, y, objectInstance))
      {
        x += lengthdir_x(granularity, dir);
        y += lengthdir_y(granularity, dir);
        exit; 
      }
    }*/
  }
}
