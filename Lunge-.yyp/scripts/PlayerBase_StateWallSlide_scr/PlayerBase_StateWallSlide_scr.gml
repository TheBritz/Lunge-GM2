Movable_ChangeVSpeed_scr(m_playerMovementWallSlideMaxSpeed, m_playerMovementWallSlideGravity);
m_spearCanDetonate = true;
if(InputManager_GetButtonControlState_scr(ButtonControls.Jump) == ButtonStates.JustPressed)
{
  Movable_ChangeVSpeed_scr(-m_playerWallSlideJumpSpeed);
  Movable_ChangeHSpeed_scr(m_playerWallSlideJumpSpeed*m_playerWallJumpLateralSpeedRatio*m_facing);;
  m_playerState = PlayerStates.None;
  m_combatantState = CombatantStates.Air;
  m_movementSuppressGravity = false;
}
else
{  
  if(m_collideV == 1)
  {
    //State changed to Ground
    m_combatantState = CombatantStates.Ground;
    m_movementSuppressGravity = false;
    m_playerState = PlayerStates.None;
    Movable_ChangeVSpeed_scr(0);
    sprite_index = m_combatantSpriteIdle;
  }
  
  if(!PlayerBase_WallSlideCheckForWall_scr(m_facing, -1))
  {
    //No wall, falling again
    m_combatantState = CombatantStates.Air;
    m_playerState = PlayerStates.None;
    m_movementSuppressGravity = false;
  }
}
