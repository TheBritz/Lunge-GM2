/// @description PlayerSpear_AddCharge_scr(spear, chargeAmount, allowOvercharge [optional])
/// @param spear
/// @param  chargeAmount
/// @param  allowOvercharge [optional]

var spear = argument[0];
var charge = argument[1];
var overcharge = false;
if(argument_count > 2)
{
  overcharge = argument[2];
}

with(spear)
{
  m_charge += charge;
  
  if(!overcharge && m_charge > m_chargeMax)
  {
    m_charge = m_chargeMax;
  }
}
