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
    if(m_facing == -1)
    {
      var dist = bbox_left - impediment.bbox_right;
      if(dist >= 0 && dist < 32)
      {
        Combatant_Jump_scr();
        break;
      }
    }
    else if(m_facing == 1)
    {
      var dist = impediment.bbox_left - bbox_right;
      if(dist >= 0 && dist < 32)
      {
        Combatant_Jump_scr();
        break;
      }
    }
  }
}