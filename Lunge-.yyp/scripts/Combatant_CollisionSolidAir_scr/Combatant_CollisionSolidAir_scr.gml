//trace("Step " + string(global.StepNumber) + ": Combatant_CollisionSolidAir_scr");

if(m_collideH != 0 || m_collideV != 0)
{
  if(m_collideV == 1)
  {
    //We are on the floor
    m_combatantState = CombatantStates.Ground;
  }
  else if(m_collideH != 0)
  {
    if(object_is(object_index, PlayerBase_obj))
    {
      //We are now facing left
      var isWallPositionCorrect = PlayerBase_WallSlideCheckForWall_scr(m_collideH);
      if(isWallPositionCorrect)
      {
        if(abs(m_impactVelH) >= m_playerWallLatchSpeedThresh)
        {
          //PlayerBase_StateTransitionWallLatch_scr(-m_collideH);
        }
        else if(abs(m_impactVelH) >= m_playerWallSlideSpeedThresh)
        {
          //PlayerBase_StateTransitionWallSlide_scr(-m_collideH);
        }
      }
    }
  }
}

