/// @description Hitbox_ExclusionListAdd_scr(hitbox, hittee)
/// @param hitbox
/// @param  hittee
var hitbox = argument0;
var hittee = argument1;

ds_list_add(hitbox.m_exclusionList, hittee);
