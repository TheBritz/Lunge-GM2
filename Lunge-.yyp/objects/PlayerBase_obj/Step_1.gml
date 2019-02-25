/// @description Charge Spear

if(PlayerSpear_IsImbedded_scr(m_spear))
{
  PlayerSpear_AddCharge_scr(m_spear, 10000, false);
  m_spearCanDetonate = true;
}
else
{
  PlayerSpear_AddCharge_scr(m_spear, m_spearChargeAmount);
}

///State Machine

switch(m_combatantState)
{
  case CombatantStates.Ground:
    PlayerBase_StateGround_scr();
    break;
  case CombatantStates.Air:
    PlayerBase_AirControlsMovement_scr();
    break;
  case CombatantStates.FastFall:
    PlayerBase_AirControlsMovement_scr();   
    break;
}

switch(m_playerState)
{
  case PlayerStates.WallLatch:
    PlayerBase_StateWallLatch_scr();  
    break;
  case PlayerStates.WallSlide:
    PlayerBase_StateWallSlide_scr();
    break;
}

///Ancestor Events
event_inherited();

