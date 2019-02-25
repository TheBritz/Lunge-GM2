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
    
    var sparkNumber = 16;
    var spark;
    var sparkSpeedRange = array(12, 23);
    var sparkDeviation = 20;
    var sparkDeccelRange = array(.8, 1.2);
    var spkDev, spkSpd, spkDcl;
    for(var i = 0; i < sparkNumber; i++)
    {
      spark = instance_create(x, y, SparkBlue_obj);
      spkDev = random_range(-sparkDeviation, sparkDeviation);
      spkSpd = random_range(sparkSpeedRange[0], sparkSpeedRange[1]);
      spkDcl = random_range(sparkDeccelRange[0], sparkDeccelRange[1]);
      spark.m_deccel = spkDcl;
      Movable_AddMotion_scr(spark, image_angle + spkDev, spkSpd);  
    }
    ds_list_clear(m_skeweredEnemies);
    return detonation;
  }
  return noone;
}
