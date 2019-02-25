//Start by getting the current piece of environment this instance is standing on
var standableSurface = instance_place(x, y + 1, StandableSurface_obj);

if(instance_exists(standableSurface))
{
  //Check for impediments
  var height = bbox_bottom - bbox_top;
  var width = bbox_right - bbox_left;
  var impediments = StandableSurface_GetImpediments_scr(standableSurface, width, height);
  for(var i = 0; i < ds_list_size(impediments); i++)
  {
    var impediment = impediments[|i];
    var dist = 0;    
    if(m_facing == -1)
    {
      dist = bbox_left - impediment.bbox_right;
    }
    else if(m_facing == 1)
    {
      dist = impediment.bbox_left - bbox_right;
    } 
      var jumpSpeedMod = 1;
    if(dist >= 0 && dist < 32)
    {
      var clearanceHeight = bbox_bottom - impediment.bbox_top;
      var shortHopHeight = jump_get_max_height(m_movementGroundJumpSpeed * 
        m_movementGroundShortHopSpeedMod, Combatant_GetEffectiveGravity_scr(id));
      if(shortHopHeight > clearanceHeight)
      {
        jumpSpeedMod = m_movementGroundShortHopSpeedMod;
      }
      Combatant_Jump_scr(jumpSpeedMod);
      break;
    }    
  }
}