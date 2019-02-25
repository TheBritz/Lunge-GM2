m_spearLungeAdjust = m_spearLungeDist;
m_lungeAngle = m_spear.image_angle;
m_spearCanLunge = false;
if(!m_spearIsLunging)
{
	m_spearIsLunging = true;
  m_spear.m_isLunging = true;
  PlayerSpear_Attack_scr(m_spear);
}
