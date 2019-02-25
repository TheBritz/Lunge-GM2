/// @param jumpSpeedModifier[optional]
/// @param jumpSpeedOverride[optional]

var speedMod = 1;
if(argument_count > 0)
{
  if(!is_undefined(argument[0]))
  {
    speedMod = argument[0];
  }
}

var speedOverride = undefined;
if(argument_count > 1)
{
  if(!is_undefined(argument[1]))
  {
    speedOverride = argument[1];
  }
}

var spd;
if(!is_undefined(speedOverride))
{
  spd = speedOverride;
}
else
{
  spd = m_movementGroundJumpSpeed;
}

if(spd > 0)
{
  spd *= -1;
}

var jumpSpeed = spd * speedMod * GameController_GetFramerateSpeedAdjustment_scr();
Movable_ChangeVSpeed_scr(jumpSpeed);

if(!is_undefined(m_audioJump))
{
  Combatant_PlaySoundOn_scr(id, m_audioJump, AudioEmitterTypes.Movement, false, 1);
}
