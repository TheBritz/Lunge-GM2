m_velocityV = 0;
m_velocityH = 0;

m_spearCanDetonate = true;
if(InputManager_GetButtonControlState_scr(ButtonControls.Jump) == ButtonStates.JustPressed)
{
  Movable_ChangeVSpeed_scr(-m_playerWallLatchJumpSpeed);
  Movable_ChangeHSpeed_scr(m_playerWallLatchJumpSpeed*m_playerWallJumpLateralSpeedRatio*m_facing);
  m_playerState = PlayerStates.None;
  m_combatantState = CombatantStates.Air;
  m_movementSuppressGravity = false;
}
