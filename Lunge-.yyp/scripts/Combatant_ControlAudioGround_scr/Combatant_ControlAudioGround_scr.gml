/// @description Combatant_ControlAudioGround_scr()
if(m_movementGroundActivelyMoving)
{
  if(!is_undefined(m_audioRun))
  {
    if(!audio_is_playing(m_audioRunInstance))
    {
      m_audioRunInstance = Combatant_PlaySoundOn_scr(id, m_audioRun, AudioEmitterTypes.Movement, true, 1);
    }
  }
}
else
{
  audio_stop_sound(m_audioRunInstance);
}
