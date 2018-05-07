/// @description is_within_range(value, min, max)
/// @param value
/// @param  min
/// @param  max

var val = argument0;
var minimum = argument0;
var maximum = argument1;

if(minimum > maximum)
{
  var tempVal = val1;
  minimum = maximum;
  maximum = tempVal;
}

return (val >= minimum && val <= maximum);

