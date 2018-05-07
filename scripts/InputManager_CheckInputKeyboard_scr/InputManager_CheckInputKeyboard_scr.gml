//Keyboard
for(var i = 0; i < ds_list_size(m_keysList); i++)
{
  var key = m_keysList[| i];
  var control = m_keyToButtonControlMap[? key];
  if(keyboard_check_pressed(key))
  { 
    m_buttonControlStates[? control] = ButtonStates.JustPressed;
  }
  else if(keyboard_check_released(key))
  {
    m_buttonControlStates[? control] = ButtonStates.JustReleased;
  }
  else if(keyboard_check(key))
  {
    m_buttonControlStates[? control] = ButtonStates.Pressed;
  }
  else
  {
    m_buttonControlStates[? control] = ButtonStates.Released; 
  }
}

//Gamepad (presses override keyboard)
for(var i = 0; i < ds_list_size(m_gamepadList); i++)
{
  var btn = m_gamepadList[| i];
  var control = m_gamepadToButtonControlMap[? btn];
  //Hard-coding for now, but device index should be properly addressed
  if(gamepad_button_check_pressed(0, btn))
  {
    m_buttonControlStates[? control] = ButtonStates.JustPressed;
  }
  else if(gamepad_button_check_released(0, btn))
  {
    m_buttonControlStates[? control] = ButtonStates.JustReleased;
  }
  else if(gamepad_button_check(0, btn))
  {
    m_buttonControlStates[? control] = ButtonStates.Pressed;
  }
}
  
