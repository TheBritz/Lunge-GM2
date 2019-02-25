/// @description PlayerBase_GetSpearHoldHeightAboveGround_scr(player)
/// @param player

var player = argument0;

with(player)
{
  return bbox_bottom - y;
}
