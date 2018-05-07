/// @description Check for solids
//trace("Step " + string(global.StepNumber) + ": Combatant_CollisionSolidGround_scr");

//Check for floor
if(m_collideV != 1)
{
  //State changed to Air
  m_combatantState = CombatantStates.Air;
}
