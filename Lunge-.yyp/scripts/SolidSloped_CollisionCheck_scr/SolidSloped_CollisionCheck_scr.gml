/// @description SolidSloped_CollisionCheck_scr(x, y, contactPointY)
/// @param x
/// @param  y
/// @param  contactPointY

var xx = argument0;
var yy = argument1;
var contactPointY = argument2;

//var solidSlopes = instance_place_list(xx, yy, SolidSloped_obj, 100);
var solidSlopes = global.ReusableHitList;
ds_list_clear(solidSlopes);
var numberOfHits = instance_place_list(xx, yy, SolidSloped_obj, solidSlopes, false);
var solidY;
for(var i = 0; i < numberOfHits; i++)
{
  var solidSlope = solidSlopes[| i];
  var solidY = SolidSloped_GetSolidY_scr(solidSlope, xx);
  if(!is_undefined(solidY) && solidY - contactPointY <= yy)
  {
    return solidY - contactPointY;
  }
}

return undefined;
