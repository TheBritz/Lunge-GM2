/// @description Check for trigger
if(!is_undefined(m_triggeringType))
{
  m_triggeringInstance = instance_place(x, y, m_triggeringType);
  if(instance_exists(m_triggeringInstance))
  {
    if(m_active)
    {
      //Trigger is ready, run the event
      if(!is_undefined(m_eventScript))
      {
        if(m_eventDelay > 0)
        {
          alarm[0] = m_eventDelay;
        }
        else
        {
          ExecuteScriptArgArray_scr(m_eventScript, m_eventArgs);
        }
        
        if(m_resetRequireLeave)
        {
          m_active = false;
        }
        else if(m_resetDelay > 0)
        {
          m_active = false;
          alarm[1] = m_resetDelay;
        }
      }
    }  
  }
  else if(m_resetRequireLeave)
  {
    if(m_resetDelay > 0)
    {
      alarm[1] = m_resetDelay;
    }
    else
    {
      m_active = true;
    }
  }
}


