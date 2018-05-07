/// @description Draw console text

if(m_active)
{
  draw_set_halign(fa_left);
  //Draw console background
  draw_rectangle_colour(m_x1 - m_drawBufferX, m_y1, m_x2, 
    m_y2 + m_drawBufferY, m_bgColor, m_bgColor, m_bgColor, m_bgColor, false);

  draw_set_font(console_fnt);
  draw_set_valign(fa_bottom);
  var h = string_height(string_hash_to_newline("A")) + 2;
  var pos = x + m_caretPosX;
  draw_line_colour(pos, y, pos, y - h, m_textColor, m_textColor);
  draw_text_colour(x - 10, y, string_hash_to_newline(">"), 
    m_textColor, m_textColor, m_textColor, m_textColor, 1);
  draw_text_colour(x, y, string_hash_to_newline(m_commandString), 
    m_textColor, m_textColor, m_textColor, m_textColor, 1);
  
  var maxIndex = ds_list_size(m_consoleDrawContent) - 1;
  var yy = y;
  for(var i = maxIndex; i > -1; i--)
  {
    yy -= h;
    draw_text_colour(x, yy, string_hash_to_newline(m_consoleDrawContent[| i]), 
      m_textColor, m_textColor, m_textColor, m_textColor, 1);
  }
  
  //Draw intellisense
  if(!m_intelliModeGuide)
  {
    var count = ds_list_size(m_intelliList);
    if(count != 0)
    {
      //Draw background
      draw_rectangle_colour(m_x1 - m_drawBufferX, m_y2 + m_drawBufferY, 
        x + m_intelliBgWidth, m_y2 + m_drawBufferY + count*h, m_intelliBgColor,
        m_intelliBgColor, m_intelliBgColor, m_intelliBgColor, false);   
      
      //Draw background highlight
      if(m_intelliIndex >= 0)
      {
        var hlDrawX1 = m_x1 - m_drawBufferX;
        var hlDrawY1 = m_y2 + m_drawBufferY + h * m_intelliIndex;
        var hlDrawX2 = x + m_intelliBgWidth;
        var hlDrawY2 = hlDrawY1 + h;
        draw_rectangle_colour(hlDrawX1, hlDrawY1, hlDrawX2, hlDrawY2,
          m_intelliBgHlColor, m_intelliBgHlColor, m_intelliBgHlColor, 
          m_intelliBgHlColor, false); 
      }
      yy = y + m_drawBufferY;
      for(var i = 0; i < count; i++)
      {
        yy += h;
        var text = m_intelliList[| i] + m_intelliInfoList[| i];
        draw_text_colour(x, yy, string_hash_to_newline(text), 
          m_textColor, m_textColor, m_textColor, m_textColor, 1);
      }
    }
  }
  else
  {
    //Draw the guide
    draw_rectangle_colour(m_x1 - m_drawBufferX, m_y2 + m_drawBufferY, 
      x + m_intelliBgWidth, m_y2 + m_drawBufferY + h, m_intelliBgColor, 
      m_intelliBgColor, m_intelliBgColor, m_intelliBgColor, false);
    yy = y + m_drawBufferY + h;
    //Draw first part
    draw_text_colour(x, yy, string_hash_to_newline(m_intelliGuideCommand + m_intelliGuideInfo1), 
      m_textColor, m_textColor, m_textColor, m_textColor, 1);
    var shiftX = string_width(string_hash_to_newline(m_intelliGuideCommand + m_intelliGuideInfo1));
    var shiftXHl = shiftX;
    //Draw highlight param
    var hlText = m_intelliGuideInfoHl;
    draw_text_colour(x + shiftX, yy, string_hash_to_newline(m_intelliGuideInfoHl), m_intelliGuideHlCol,
      m_intelliGuideHlCol, m_intelliGuideHlCol, m_intelliGuideHlCol, 1);
    shiftX = shiftX + string_width(string_hash_to_newline(m_intelliGuideInfoHl));
    //Draw the rest
    draw_text_colour(x + shiftX, yy, string_hash_to_newline(m_intelliGuideInfo2), m_textColor, 
    m_textColor, m_textColor, m_textColor, 1);
    
    if(!is_undefined(m_suggestionList))
    {
      var suggCount = ds_list_size(m_suggestionList);
      if(suggCount > 0)
      {
        //Draw Suggestion background
        var suggDrawY1 = m_y2 + m_drawBufferY*2 + h;
        var suggDrawY2 = suggDrawY1 + suggCount*h;
        var x1 = x + shiftXHl;
        var x2 = x1 + m_suggestionDrawWidth + m_drawBufferX*2
        draw_rectangle_colour(x1 - m_drawBufferX, suggDrawY1, x2, suggDrawY2, 
          m_intelliBgColor, m_intelliBgColor, m_intelliBgColor, m_intelliBgColor, false);
        //Draw highlighted suggestion
        if(m_suggestionIndex >= 0)
        {
          draw_rectangle_colour(x1 - m_drawBufferX, suggDrawY1 + m_suggestionIndex*h,
            x2, suggDrawY1 + m_suggestionIndex*h + h, m_intelliBgHlColor,
            m_intelliBgHlColor, m_intelliBgHlColor, m_intelliBgHlColor, false);
        }
        yy = suggDrawY1;
        for(var i = 0; i < suggCount; i++)
        {
          yy += h;
          var text = m_suggestionList[| i];
          draw_text_colour(x1, yy, string_hash_to_newline(text), m_textColor,
            m_textColor, m_textColor, m_textColor, 1);
        }
      }
    }
  }
}

