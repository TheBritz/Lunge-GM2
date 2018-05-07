/// @description Handle Typing
if(m_active)
{
  var kbdStrLen = string_length(keyboard_string);
  var diff = kbdStrLen - string_length(m_commandString);
  m_caretPos += diff;
  var newChars = "";
  if(diff > 0)
  {
    var index = kbdStrLen - diff + 1;
    newChars = string_copy(keyboard_string, index, diff);
  }
  
  m_commandString = keyboard_string;
  
  if(keyboard_check_pressed(vk_enter))
  {
    ParseConsoleCommand_scr(m_commandString);  
    m_commandString = "";
    keyboard_string = "";
    m_caretPos = 0;
    m_bufferDrawLast = true;
    //Reset Intellisense
    ds_list_clear(m_intelliList);
    ds_list_clear(m_intelliInfoList);
    m_intelliIndex = -1;
    m_intelliModeGuide = false;
  }
  else if(keyboard_check(vk_backspace))
  {
    var len = string_length(m_commandString);
    if(len > 0)
    {
      //m_commandString = string_delete(m_commandString, m_caretPos, 1);
      //m_caretPos--;
      if(m_intelliModeGuide)
      {
        //Check if we're still in guide mode
        if(string_pos(m_intelliGuideCommand + "(", m_commandString) != 1)
        {
          m_intelliModeGuide = false;
          //BuildIntellisenseList_scr(m_commandString);
        }
      }
      BuildIntellisenseList_scr(m_commandString);
      m_intelliGuideBufferRequired = true;
    }
    else
    {
      ds_list_clear(m_intelliList);
      ds_list_clear(m_intelliInfoList);
      m_intelliIndex = -1;
    }
  }
  else if(keyboard_check(vk_left))
  {
    if(m_caretPos > -1)
    {
      m_caretPos--;
    }
  }
  else if(keyboard_check(vk_right))
  {
    var len = string_length(m_commandString);
    if(m_caretPos < (len))
    {
      m_caretPos++;
    }
  }
  else if(keyboard_check_pressed(vk_up))
  {
    if(m_intelliModeGuide)
    {
      var suggSize = ds_list_size(m_suggestionList);
      if(suggSize > 0 && m_suggestionIndex >= 0)
      {
        m_suggestionIndex -= 1;
      }
    }
    else
    {
      var intelliSize = ds_list_size(m_intelliList);
      if(intelliSize > 0 && m_intelliIndex >= 0)
      {
        m_intelliIndex -= 1;
      }
      else if(m_historyIndex == -1 && ds_list_size(m_consoleHistory) > 0)
      {
        //Go to the last entry in the console history
        m_historyIndex = ds_list_size(m_consoleHistory) - 1;
        m_commandString = m_consoleHistory[| m_historyIndex];
        m_caretPos = string_length(m_commandString);
      }
      else if(m_historyIndex > 0)
      {
        m_historyIndex--;
        m_commandString = m_consoleHistory[| m_historyIndex];
        m_caretPos = string_length(m_commandString);
      }
    }
  }
  else if(keyboard_check_pressed(vk_down))
  {
    if(m_intelliModeGuide)
    {
      var suggSize = ds_list_size(m_suggestionList);
      if(suggSize > 0 && m_suggestionIndex < suggSize - 1)
      {
        m_suggestionIndex += 1;
      }
    }
    else
    {
      var intelliSize = ds_list_size(m_intelliList);
      if(intelliSize > 0 && m_intelliIndex < intelliSize)
      {
        m_intelliIndex += 1;
      }
      else if(m_historyIndex != -1 && m_historyIndex < (ds_list_size(m_consoleHistory) - 1))
      {
        m_historyIndex++;
        m_commandString = m_consoleHistory[| m_historyIndex];
        m_caretPos = string_length(m_commandString);
      }
    }
  }
  else if(keyboard_check_pressed(vk_tab))
  {
    //Autocomplete intellisense
    if(m_intelliModeGuide)
    {
      if(!is_undefined(m_suggestionList) && ds_list_size(m_suggestionList) > 0)
      {
        if(m_suggestionIndex == -1) m_suggestionIndex = 0;
        var suggestion = m_suggestionList[| m_suggestionIndex];
        var pos = string_pos("(", m_commandString);
        var len = string_length(m_commandString);
        var cmd = string_delete(m_commandString, pos + 1, len);
        var args = string_delete(m_commandString, 1, pos + 1);
        var argsArr = split(args, ",");
        var argNumber = array_length_1d(argsArr);
        var maxIndex = argNumber - 1;
        argsArr[maxIndex] = suggestion;
        for(var i = 0; i < argNumber; i++)
        {
          cmd += argsArr[i];
          if(i < argNumber - 1)
          {
            cmd += ",";
          }   
        }
        m_commandString = cmd;
        m_caretPos = string_length(m_commandString);
        if(!is_undefined(m_suggestionList))
        {
          ds_list_clear(m_suggestionList);
        }
        m_suggestionIndex = -1;
      }
    }
    else
    {
      if(ds_list_size(m_intelliList) > 0) 
      {
        if(m_intelliIndex == -1) m_intelliIndex = 0;
        m_commandString = m_intelliList[| m_intelliIndex];
        var info = m_intelliInfoList[| m_intelliIndex];
        if(string_pos("()", info) == 1)
        {
          //This is a parameterless command - add in the parens for ease
          m_commandString += "()";
        }
        else
        {
          m_commandString += "(";
        }
        m_caretPos = string_length(m_commandString);
      }
    }
    keyboard_string = m_commandString;
  }
  else
  {
    if(keyboard_key != m_lastKey)
    {
      m_keySuppress = false;
    }
    m_lastKey = keyboard_key;
    
    if(!m_keySuppress)
    {
      if(keyboard_key != 0)
      {
        var attempt = m_knownKeysMap[? keyboard_key];
        var char;
        if(!is_undefined(attempt))
        {
          if(string_length(attempt) == 1)
          {
            char = attempt;
          }
          else
          {
            char = "";
          }
        }
        else
        {
          char = chr(keyboard_key);
        }
        
        if(keyboard_key >= 65 && keyboard_key <= 90)
        {
          if(!keyboard_check(vk_shift))
          {
            char = string_lower(char);
          } 
        }
        else
        {
          var attempt = m_knownKeysMap[? char];
          if(!is_undefined(attempt))
          {
            char = attempt;
          }
            
          if(keyboard_check(vk_shift))
          {
            var attempt = m_shiftMap[? char];
            if(!is_undefined(attempt))
            {
              char = attempt;
            }
            
            if(char == ")")
            {
              //Clear suggestion lists
              ds_list_clear(m_suggestionList);
              ds_list_clear(m_suggestionDisplayList);
            }
          }  
        }
        
        //m_commandString += char;       
        m_caretPos++;
        m_keySuppress = true;
        m_intelliGuideBufferRequired = true;
        if(string_length(m_commandString) >= m_intelliThresh && char != "")
        {
          if(ds_list_size(m_intelliList) == 0)
          {
            BuildIntellisenseList_scr(m_commandString);
            var test = m_intelliList;
            var test2 = "test";
          }
          else if(!m_intelliModeGuide)
          {
            //Check to see if we should be going to guide mode        
            if(string_pos("(", m_commandString) != 0 && ds_list_size(m_intelliList) > 0)
            {
              m_intelliIndex = 0;
              var intelliCommand = m_intelliList[| m_intelliIndex];
              if(string_pos(intelliCommand + "(", m_commandString) == 1)
              {
                m_intelliModeGuide = true;
                m_intelliGuideCommand = m_intelliList[| m_intelliIndex];
                if(is_undefined(m_intelliGuideCommand))
                {
                  m_intelliGuideCommand = "Error: intellisense command was undefined. ";
                }
                m_intelliGuideInfo = m_intelliInfoList[| m_intelliIndex];
                if(is_undefined(m_intelliGuideInfo))
                {
                  m_intelliGuideInfo = "Error: intellisense info was undefined";
                }
                m_intelliIndex = -1;
              }
            }
            
            UpdateIntellisenseList_scr(m_commandString);
          }
        }
      }  
      else
      {
        m_keySuppress = false;
      }
    }  
  }
}
else
{
  m_keySuppress = false;
}

