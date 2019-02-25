/// @description SolidSloped_GetSolidY_scr(slopedSolid, x)
/// @param slopedSolid
/// @param  x

var slopedSolid = argument0;
var xx = argument1;
var ySolid = undefined;

with(slopedSolid)
{
  var facingMod = sign(image_xscale);
  var top = bbox_top;
  var bottom = bbox_bottom;
  var sizeY = bottom - top;
  var left = bbox_left;
  var right = bbox_right;
  if(left <= xx && xx <= right)
  {
    var sizeX = right - left;
    var slope = sizeY/sizeX * facingMod;
    var xRel = xx - left;
    if(xRel >= 0)
    {
      var startPoint;
      if(image_xscale > 0)
      {
        startPoint = bottom;
      }
      else
      {
        startPoint = top;
      }
      
      ySolid = slope * xRel;
      return startPoint - ySolid; 
    }
  }
}

return undefined;
