/// @description Init
m_player = undefined;
m_shaft = undefined;
m_speedMax = 4;
m_accel = .05;
m_yBottom = 0;
m_slowDownPoint = 200;
m_slowDownMinSpd = 1.5;
depth = -100;
image_speed = 0;

m_audioEmitter = audio_emitter_create();
audio_emitter_position(m_audioEmitter, x, y, 0);



