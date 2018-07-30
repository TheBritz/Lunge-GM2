/// @description Handle solid collision
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(m_impactVelH != 0)
{   
  m_velocityH = -m_impactVelH*m_bounceQuotientH;
  m_velocityV *= m_frictionQuotientV;
}

if(m_impactVelV != 0)
{
  m_velocityV = -m_impactVelV*m_bounceQuotientV;
  m_velocityH *= m_frictionQuotientH;
}

Combatant_ApplyGravity_scr();
