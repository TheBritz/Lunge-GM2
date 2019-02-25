/// @description Hitbox_InstancePlaceList_scr(x, y, objectIndex, maskIndex)
/// @param x
/// @param  y
/// @param  objectIndex
/// @param  maskIndex
var hits,inst,list,x1,y1,obj,limit;
hits = 0;
x1 = argument[0];
y1 = argument[1];
obj = argument[2];

if(argument_count > 3)
{
  limit = argument[3];
}
else
{
  limit = 1;
}

var checkSolid = false;
if(argument_count > 4)
{
  checkSolid = argument[4];
}

if(argument_count > 5)
{
  list = argument[5];
}
else
{
  list = global.ReusableHitList;
  ds_list_clear(list);
}

if(debug_mode)
{
  var hitRep = instance_create(x1, y1, HitboxRepresentation_obj);
  hitRep.sprite_index = maskInd;
}

with(Hitbox_obj)
{
  mask_index = maskInd; 
  return instance_place_list(x1, y1, obj, checkSolid, list);
}


