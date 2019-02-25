////Get melee enemy list
var enemyList = argument0;

if(!is_undefined(enemyList))
{
  var enemy;
  var numberOfEnemies = ds_list_size(enemyList);
  for(var i = 0; i < numberOfEnemies; i++)
  {
    enemy = enemyList[|i];
    relativePosition = enemy.x - m_target.x;
    enemy.m_engagementControllerRelativePosition = relativePosition;
  }

  if(numberOfEnemies > 1)
  {
    sort_object_list_by_variable(enemyList, "m_engagementControllerRelativePosition", SortingOrder.Ascending);
    var distances;
    for(var i = 0; i < numberOfEnemies; i++)
    {
      distances[i] = enemyList[|i].m_engagementControllerRelativePosition;
    }
  }
  
  #region Arrange Engagers
  if(numberOfEnemies >= 1)
  {
    var posMod, posAssign, side, differential;
    for(var i = 0; i < numberOfEnemies; i++)
    {
      posMod = 1;
      var enemy = enemyList[|i];
      if(!EngagementController_IsEnemyEngaged_scr(enemy))
      {
        differential = m_engagementNumberOnRight - m_engagementNumberOnLeft;
        if(differential > 2)
        {
          side = Direction2D.Left;
        }
        else if(differential < -2)
        {
          side = Direction2D.Right;
        }
        else
        {
          side = sign(enemy.m_engagementControllerRelativePosition);
        }
        
        posAssign = EngagementController_GetClosestOpenPosition_scr(side);
        
        if(abs(differential) > 2)
        {
          enemy.m_aiState = EnemyAIStates.LeapAttacking;
        }
        
        EngagementController_AssignPosition_scr(enemy, posAssign);
      }
    }
  }
  #endregion
  
	#region Move Engagers forward (if close-combat)
	var posOpenRight = EngagementController_GetClosestOpenPosition_scr(Direction2D.Right);
	if(posOpenRight == 1)
  {
		var test = "test";
	}
	var numberOfEnemies = ds_map_size(m_engagementPositionAssignementsByPos);
	for(var i = 1; i <= numberOfEnemies; i++)
	{
		if(ds_map_exists(m_engagementPositionAssignementsByPos, i))
		{
			var enemy = m_engagementPositionAssignementsByPos[? i];
			if(posOpenRight < i)
			{
				EngagementController_AssignPosition_scr(enemy, posOpenRight);
			}
		}
	}
	#endregion
	
  #region Control Melee attacks from closest Fighters
  if(ds_map_exists(m_engagementPositionAssignementsByPos, -1))
  {
    var closest = m_engagementPositionAssignementsByPos[? -1];
    if(instance_exists(closest) && closest.m_engagementInPosition)
		{
			if(closest.m_aiState == EnemyAIStates.EngagingAntagonist)
		  {
			  closest.m_aiState = EnemyAIStates.Attacking;
			}
		}
  }
  
  if(ds_map_exists(m_engagementPositionAssignementsByPos, 1))
  {
    var closest = m_engagementPositionAssignementsByPos[? 1]; 
		if(instance_exists(closest) && closest.m_engagementInPosition)
		{
			if(closest.m_aiState == EnemyAIStates.EngagingAntagonist)
		  {
			  closest.m_aiState = EnemyAIStates.Attacking;
			}
		}
  }
  #endregion
  
  #region Test Leap Attack
  //Test leap attack
  //if(numberOfEnemies > 0)
  //{
  //  enemy = enemyList[|0];
  //  with(enemy)
  //  {
  //    var dist = abs(other.m_target.x - x);
  //    if(is_undefined(m_combatLeapAttackRange) || dist < m_combatLeapAttackRange)
  //    {
  //      if(Combatant_GetState_scr(enemy) == CombatantStates.Ground)
  //      {
  //        EnemyAI_StartLeapAttack_scr(enemy, other.m_target);
  //      }
  //    }
  //  }
  //}
  #endregion
}