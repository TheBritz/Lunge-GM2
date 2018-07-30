/// @description PlayerSpear_PositionSkeweredEnemies_scr(spear)
/// @param spear

var spear = argument0;

with(spear)
{
  var coords = relative_coordinates(x, y, m_skewerPosX, m_skewerPosY, image_angle);
  for(var i = 0; i < ds_list_size(m_skeweredEnemies); i++)
  {
    var enemy = m_skeweredEnemies[|i];
    enemy.x = coords[0];
    enemy.y = coords[1];
    enemy.image_angle = image_angle;
    enemy.depth = depth - 1;
  }
}
