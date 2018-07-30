/// @param projectile
/// @param bounceQuotient
/// @param replaceDirectionalSetting[optional]

var projectile = argument[0];
var bounceQ = argument[1];

var replace = false;
if(argument_count > 2)
{
  replace = argument[2];
}

with(projectile)
{
  if(is_undefined(m_bounceQuotientH) || replace)
  {
    m_bounceQuotientH = bounceQ;
  }

  if(is_undefined(m_bounceQuotientV) || replace)
  {
    m_bounceQuotientV = bounceQ;
  }
}