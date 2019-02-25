/// @description Hitbox_PlaceMeeting_scr(x, y, objectIndex, maskIndex)
/// @param x
/// @param  y
/// @param  objectIndex
/// @param  maskIndex
var X = argument0;
var Y = argument1;
var objInd = argument2;
var maskInd = argument3;

if(debug_mode)
{
  var hitRep = instance_create(X, Y, HitboxRepresentation_obj);
  hitRep.sprite_index = maskInd;
}

with(Hitbox_obj)
{
  mask_index = maskInd; 
  return place_meeting(X, Y, objInd);
}

if(debug_mode)
{
  var hitRep = instance_create(X, Y, HitboxRepresentation_obj);
  hitRep.sprite_index = maskInd;
}
