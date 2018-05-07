/// @description limit_value_magnitude(value, limit)
/// @param value
/// @param  limit

var val = argument0;
var limit = argument1;

if(abs(val) > abs(limit))
{
  var newVal = limit * sign(val);
  return newVal;
}
else
{
  return val;
}
