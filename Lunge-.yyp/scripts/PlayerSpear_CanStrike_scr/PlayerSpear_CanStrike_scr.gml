/// @description PlayerSpear_CanStrike_scr(spear)
/// @param spear

//Returns whether or not the spear is in a striking state

var spear = argument0;

with(spear)
{
  return m_strikeTimer > 0;
}

