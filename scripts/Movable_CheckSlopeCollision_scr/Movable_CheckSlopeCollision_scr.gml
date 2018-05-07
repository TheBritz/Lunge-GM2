/// @description Movable_CheckSlopeCollision_scr

var slopeStickAdjust = 0;
var slope = instance_place(x, y, SolidSloped_obj)
if(m_slopeStickFactor > 0 && 
   instance_exists(slope) && 
   sign(m_velocityH) != sign(slope.image_xscale))
{
  slopeStickAdjust = m_slopeStickFactor * abs(m_velocityH);
  if(object_index == Player1_obj)
  {
    var test = "test";
  }
}

var bottom = sprite_get_height(mask_index) * 
  image_yscale - sprite_get_yoffset(mask_index) * image_yscale;
var xx = x;
if(instance_exists(slope))
{
  if(slope.image_xscale > 0)
  {
    xx = bbox_right;
    if(xx > slope.bbox_right)
    {
      xx = slope.bbox_right;
    }
  }
  else
  {
    xx = bbox_left;
    if(xx < slope.bbox_left)
    {
      xx = slope.bbox_left;
    }
  } 
}

var solidY = SolidSloped_CollisionCheck_scr(xx, y + slopeStickAdjust, bottom);
if(!is_undefined(solidY))
{
  y = solidY;
  m_collideV = 1;
  if(m_velocityV > 0)
  {
    m_impactVelV = m_velocityV;
  }
  m_velocityV = 0;
}
else if(instance_exists(slope))
{
  var test = "test";
}

var solidCollision = instance_place(x, y, Solid_obj);
if(instance_exists(solidCollision))
{
  move_outside(solidCollision, 90, 5);
  y = floor(y);
}

return solidY;

