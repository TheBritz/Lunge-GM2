/// @description move_until_solid(xStart, yStart, xEnd, yEnd, increment)
/// @param xStart
/// @param  yStart
/// @param  xEnd
/// @param  yEnd
/// @param  increment

var X = argument0;
var Y = argument1;
var xStop = argument2;
var yStop = argument3;
var increment = argument4;

//Initial distance check
var dir = point_direction(X, Y, xStop, yStop);
var distInit = point_distance(X, Y, xStop, yStop);

var xInc, yInc;
xInc = lengthdir_x(increment, dir);
yInc = lengthdir_y(increment, dir);

while(place_free(x, y))
{
  x += xInc;
  y += yInc;
  var dist = point_distance(X, Y, x, y);
  if(dist >= distInit)
  {
    //We went as far as we should
    x = xStop;
    y = yStop;
    exit;
  }
}

x -= xInc;
y -= yInc;
