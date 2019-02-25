/// @description Check for console activation

if(keyboard_check_pressed(m_activationKey))
{
  m_active = !m_active
  if(m_active)
  {
    m_lastKey = keyboard_key;
    m_keySuppress = true;
    keyboard_string = "";
  }
}

