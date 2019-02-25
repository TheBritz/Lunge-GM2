/// @description Positioning

if(!is_undefined(m_relPosX))
{
  x = m_relPosX * __view_get( e__VW.WView, 0 );
}

if(!is_undefined(m_relPosY))
{
  y = m_relPosY * __view_get( e__VW.HView, 0 );
}

if(!is_undefined(m_relWidth))
{
  m_width = __view_get( e__VW.WView, 0 ) * m_relWidth;
}

if(!is_undefined(m_relHeight))
{
  m_height = __view_get( e__VW.HView, 0 ) * m_relHeight;
}

m_x1 = x;
m_y1 = y - m_height;
m_x2 = x + m_width;
m_y2 = y;

//Position Caret
var len = string_length(m_commandString);

var str = string_delete(m_commandString, m_caretPos + 1, len);
m_caretPosX = string_width(string_hash_to_newline(str));

///Buffer draw list
var line, width;
if(m_bufferDrawLast)
{
  m_bufferDrawLast = false;
  //Get the last line in the console content list
  var lastIndex = ds_list_size(m_consoleContent) - 1;
  line = m_consoleContent[| lastIndex];
  width = string_width(string_hash_to_newline(line));
  if(width >= m_width)
  {
    //This line will hang over the console box; it needs to be broken-up
    var wordsArr = split(line, " ");
    var lineTemp = "";
    for(var n = 0; n < array_length_1d(wordsArr); n++)
    {
      if(string_width(string_hash_to_newline(lineTemp + " " + wordsArr[n])) < m_width)
      {
        if(lineTemp != "")
        {
          lineTemp += " ";
        }
        lineTemp += wordsArr[n];
      }
      else
      {
        ds_list_add(m_consoleDrawContent, lineTemp);
        lineTemp = "";
        n--;
      } 
    }
    
    if(lineTemp != "")
    {
      ds_list_add(m_consoleDrawContent, lineTemp);
    }
  }
  else
  {
    ds_list_add(m_consoleDrawContent, line); 
  }
}

if(m_bufferDraw)
{
  ds_list_clear(m_consoleDrawContent);
  m_bufferDraw = false;
  for(var i = 0; i < ds_list_size(m_consoleContent); i++)
  {
    line = m_consoleContent[| i];
    width = string_width(string_hash_to_newline(line));
    if(width >= m_width)
    {
      //This line will hang over the console box; it needs to be broken-up
      var wordsArr = split(line, " ");
      var lineTemp = "";
      for(var n = 0; n < array_length_1d(wordsArr); n++)
      {
        if(string_width(string_hash_to_newline(lineTemp + " " + wordsArr[n])) < m_width)
        {
          if(lineTemp != "")
          {
            lineTemp += " ";
          }
          lineTemp += wordsArr[n];
        }
        else
        {
          if(lineTemp == "")
          {
            //ToDo: Add in logic to split up a long line with no spaces
          }
          ds_list_add(m_consoleDrawContent, lineTemp);
          lineTemp = "";
          n--;
        } 
      }
      
      if(lineTemp != "")
      {
        ds_list_add(m_consoleDrawContent, lineTemp);
      }
    }
    else
    {
      ds_list_add(m_consoleDrawContent, line); 
    } 
  }
}

///Buffer Intellisense Guide

//Get the current parameters
if(m_intelliModeGuide)
{
  if(m_intelliGuideBufferRequired)
  {
    m_intelliGuideBufferRequired = false;
    //Get the width of the intelli background
    m_intelliBgWidth = m_width;
    var intelliBgWidth = string_width(string_hash_to_newline(m_intelliGuideCommand + m_intelliGuideInfo));
    if(m_width < intelliBgWidth)
    {
      m_intelliBgWidth = intelliBgWidth;
    }
    
    var cmdArr = split(m_commandString, "(");
    
    if(array_length_1d(cmdArr) > 1)
    {
      var paramArr = split(cmdArr[1], ")"); 
      var currentParams = paramArr[0];
      var commaArr = split(currentParams, ",");
      var commaCount = array_length_1d(commaArr) - 1;
      
      //Get the guide parameters
      var guideParamArr = split(m_intelliGuideInfo, ")");
      var len = array_length_1d(guideParamArr)
      if(len > 1 && string_pos(")", m_commandString) == 0)
      {
        var guideParams = guideParamArr[0];
        //Remove leading '('
        guideParams = string_delete(guideParams, 1, 1);
        var arr = split(guideParams, ",");
        if(commaCount < array_length_1d(arr))
        {
          var paramTypeArr = split(arr[commaCount], " ");
          GetSuggestionList_scr(m_commandString, commaCount, paramTypeArr[0]);      
        }
        
        var infoPt1 = "(";
        var infoPt2 = "";
        var pt1 = true;
        m_intelliGuideInfoHl = "";
        for(var i = 0; i < array_length_1d(arr); i++)
        {
          if(i == commaCount)
          {
            m_intelliGuideInfoHl = arr[i];
            pt1 = false;
            if(i < array_length_1d(arr) - 1) infoPt2 += ",";
          }
          else if(pt1)
          {
            infoPt1 += arr[i];
            if(i < array_length_1d(arr) - 1)
            {
              infoPt1 += ",";
            }
          }
          else
          {
            infoPt2 += arr[i];
            if(i < array_length_1d(arr) - 1)
            {
              infoPt2 += ",";
            }
          }
        }
        infoPt2 += ")";
        //Add the description back in
        if(array_length_1d(guideParamArr) > 1)
        {
          infoPt2 += guideParamArr[1];
        }
        m_intelliGuideInfo1 = infoPt1;
        m_intelliGuideInfo2 = infoPt2;
      }
      else
      {
        m_intelliGuideInfo1 = m_intelliGuideInfo;
        m_intelliGuideInfoHl = "";
        m_intelliGuideInfo2 = "";
      }
    }
  }
}
else
{
  m_intelliBgWidth = m_width;
  var thisWidth;
  //Get intellisense background width
  for(var i = 0; i < ds_list_size(m_intelliList); i++)
  {
    thisWidth = string_width(string_hash_to_newline(m_intelliList[|i ] + 
      m_intelliInfoList[| i])) + m_drawBufferX;
    
    if(thisWidth > m_intelliBgWidth)
    {
      m_intelliBgWidth = thisWidth;
    }
  }
}


