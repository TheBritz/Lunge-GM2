/// @description PlayerSpear_Attack_scr(spear, strikeTimeOverride [optional])
/// @param spear
/// @param  strikeTimeOverride [optional]

var spear = argument[0];
//Strike time is the amount of time that the hitbox will be active
var strikeTime = undefined;
if(argument_count > 1)
{
  strikeTime = argument[1];
}

with(spear)
{
  sprite_index = PlayerSpearLunging_spr;
  image_speed = .5;
  if(!is_undefined(strikeTime))
  {
    m_strikeTimer = strikeTime;
  }
  else
  {
    m_strikeTimer = m_strikeTime;
  }
}


