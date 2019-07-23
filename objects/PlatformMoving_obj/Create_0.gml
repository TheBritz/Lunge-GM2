/// @description Insert description here
// You can write your code in this editor
event_inherited();

m_maxSpeed = 6;
m_accel = .15;
m_dir = 1;
m_solidObservant = false;

EventManager_AddEvent_scr
  (PlatformMoving_EventReverseDirection_scr, 4, true);