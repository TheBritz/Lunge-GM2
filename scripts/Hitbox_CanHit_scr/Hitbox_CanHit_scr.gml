/// @description Hitbox_CanHit_scr(hitbox, hittee)
/// @param hitbox
/// @param  hittee
var hitbox = argument0;
var hittee = argument1;
with(hitbox)
{
  return ds_list_find_index(m_exclusionList, hittee) == -1;
}
