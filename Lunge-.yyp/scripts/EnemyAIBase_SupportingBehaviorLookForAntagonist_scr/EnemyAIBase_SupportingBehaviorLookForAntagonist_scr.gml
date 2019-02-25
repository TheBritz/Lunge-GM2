/// @description EnemyAIBase_SupportingBehaviorLookForAntagonist_scr()

//Loop through each instance of the Antagonist Type
with(m_aiAntagonistType)
{
  //Check if the friendly is close enough to see
  var dist = distance_to_object(other.id);
  if(dist < other.m_aiSightMaxDist)
  {  
    //Friendly is close enough, now check if the view to the friendly is 
    //unobstructed
    var hit = collision_line(other.x, other.y, x, y, Solid_obj, false, false);
    if(!instance_exists(hit))
    {
      //Antagnoist in sight
      other.m_aiTarget = id;
      other.m_aiState = EnemyAIStates.PursuingAntagonist;
      break;
    } 
  }  
}

