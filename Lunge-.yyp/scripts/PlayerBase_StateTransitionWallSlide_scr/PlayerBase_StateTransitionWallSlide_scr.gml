/// @description PlayerBase_StateTransitionWallSlide_scr(facing)
/// @param facing
trace("Wall Slide");
var facing = argument0;
//Set player vspeed, sprite and direction facing
if(object_is(object_index, PlayerBase_obj))
{
  if(m_playerState != PlayerStates.WallSlide &&
     m_combatantState != CombatantStates.HitStun)
  {
    m_facing = facing;
    m_movementSuppressGravity = true;
    m_velocityV*=.35;
    Movable_ChangeHSpeed_scr(0);
    m_playerState = PlayerStates.WallSlide;
    m_combatantState = CombatantStates.None;
    sprite_index = m_playerSpriteWallCling;
  }
}


