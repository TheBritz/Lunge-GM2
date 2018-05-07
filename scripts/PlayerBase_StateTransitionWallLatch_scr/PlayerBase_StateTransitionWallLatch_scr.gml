/// @description PlayerBase_StateTransitionWallLatch_scr(facing)
/// @param facing
trace("Wall Latch");
var facing = argument0;
//Set player vspeed, sprite and direction facing
if(object_is(object_index, PlayerBase_obj))
{
  if(m_playerState != PlayerStates.WallLatch &&
     m_combatantState != CombatantStates.HitStun)
  {
    m_facing = facing;
    m_movementSuppressGravity = true;
    Movable_ChangeVSpeed_scr(0);
    Movable_ChangeHSpeed_scr(0);
    m_playerState = PlayerStates.WallLatch;
    m_combatantState = CombatantStates.None;
    alarm[0] = m_playerMovementWallLatchTime;
    sprite_index = m_playerSpriteWallCling;
  }
}


