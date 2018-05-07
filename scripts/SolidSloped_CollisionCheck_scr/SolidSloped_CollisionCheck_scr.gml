/// @description SolidSloped_CollisionCheck_scr(x, y, contactPointY)
/// @param x
/// @param  y
/// @param  contactPointY

var xx = argument0;
var yy = argument1;
var contactPointY = argument2;

var solidSlopes = instance_place_list(xx, yy, SolidSloped_obj, 100);
var solidY;
for(var i = 0; i < ds_list_size(solidSlopes); i++)
{
  var solidSlope = solidSlopes[| i];
  var solidY = SolidSloped_GetSolidY_scr(solidSlope, xx);
  if(!is_undefined(solidY) && solidY - contactPointY <= yy)
  {
    return solidY - contactPointY;
  }
}

return undefined;
