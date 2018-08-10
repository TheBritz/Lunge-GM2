/// @description Projectile Init
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//The rate of movement acceleration
m_accelRate = undefined;
//How elastic the projectile is
m_bounceQuotientH = undefined;
m_bounceQuotientV = undefined;

//How much the projectile slows down (multiplicative) when it bounces
m_frictionQuotientH = 1;
m_frictionQuotientV = 1;

//How much the projectile slows down (additive) when it bounces
m_frictionH = 0;
m_frictionV = 0;