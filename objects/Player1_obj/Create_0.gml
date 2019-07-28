/// @description Init
event_inherited();
m_wielder = noone;
m_spear = instance_create(x, y, PlayerSpear_obj);
m_spear.m_wielder = id;
m_playerIndex = 0;
m_combatantImageSpeedRun = 1;

