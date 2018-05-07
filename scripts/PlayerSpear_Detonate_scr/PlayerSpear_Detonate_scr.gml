/// @description PlayerSpear_Detonate_scr(spear)
/// @param spear

var spear = argument0;

with spear
{
  if(PlayerSpear_CanDetonate_scr(id))
  {
    var spearLength = sprite_width - sprite_xoffset - 5;
    var coords = relative_coordinates(x, y, spearLength, 0, spear.image_angle);
    var detonation = instance_create(coords[0], coords[1], SpearDetonation_obj);
    detonation.depth = depth - 1;
    m_charge -= m_chargeToDetonate;
    var enemy;
    for(var i = 0; i < ds_list_size(m_skeweredEnemies); i++)
    {
      enemy = m_skeweredEnemies[| i];
      enemy.speed = 15; 
      enemy.direction = image_angle;
      enemy.gravity = .2;
      enemy.sprite_index = EnemyHollowLaunched_spr;
    } 
    ds_list_clear(m_skeweredEnemies);
    return detonation;
  }
  return noone;
}
