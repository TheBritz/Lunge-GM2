Movable_ChangeVSpeed_scr(-m_movementGroundJumpSpeed);

if(!is_undefined(m_audioJump))
{
  Combatant_PlaySoundOn_scr(id, m_audioJump, AudioEmitterTypes.Movement, false, 1);
}
