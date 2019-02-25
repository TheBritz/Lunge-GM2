/// @description PlayerBase_ThrowMovmentDust_scr(player)
/// @param player

var player = argument0;
instance_create(player.x, player.bbox_bottom, MovementDust_obj);
