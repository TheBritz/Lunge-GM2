/// @description Perform AI engagement control

m_ticker--;

if(m_ticker <= 0)
{
  //Assess
  
  //Get melee enemy list
  var meleeList = m_engagementMap[? EnemyEnforcer_obj];
  
  EngagementController_AssessEnemyPositions_scr(meleeList);
  
  m_ticker = m_tickRate;
}
