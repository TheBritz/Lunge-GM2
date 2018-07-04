/// @param jumpSpeedModifier[optional]

var speedMod = 1;
if(argument_count > 0)
{
  speedMod = argument[0];
}

Movable_ChangeVSpeed_scr(-m_movementGroundJumpSpeed * speedMod);

if(!is_undefined(m_audioJump))
{
  Combatant_PlaySoundOn_scr(id, m_audioJump, AudioEmitterTypes.Movement, false, 1);
}
