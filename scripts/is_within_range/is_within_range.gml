/// @description is_within_range(value, min, max)
/// @param value
/// @param  min
/// @param  max

var val = argument0;
var minimum = argument1;
var maximum = argument2;

if(minimum > maximum)
{
  var tempVal = val1;
  minimum = maximum;
  maximum = tempVal;
}

return (val >= minimum && val <= maximum);

