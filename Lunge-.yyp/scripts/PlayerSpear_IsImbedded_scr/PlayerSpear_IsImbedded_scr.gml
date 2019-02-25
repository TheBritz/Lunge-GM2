/// @description PlayerSpear_IsImbedded_scr(spear)
/// @param spear

var spear = argument0;

with(spear)
{
  return !is_undefined(m_imbedPointX) && !is_undefined(m_imbedPointY);
}
