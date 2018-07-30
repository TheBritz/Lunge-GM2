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
      with(enemy)
      {
        var sprite = sprite_index;
        instance_change(EnemyLaunched_obj, false);
        event_perform_object(EnemyLaunched_obj, ev_create, 0);
        sprite_index = sprite;
        Movable_AddMotion_scr(id, spear.image_angle, 15);
        if(!is_undefined(m_enemySpriteLaunched))
        {
          sprite_index = m_enemySpriteLaunched;
        }
        if(image_angle >= 90 && image_angle <= 270)
        {
          image_yscale = -1;
        }
      }
    } 
    ds_list_clear(m_skeweredEnemies);
    return detonation;
  }
  return noone;
}
