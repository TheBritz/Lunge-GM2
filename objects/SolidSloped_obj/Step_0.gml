if(debug_mode)
{
  var solidY = SolidSloped_GetSolidY_scr(id, mouse_x);
  if(!is_undefined(solidY))
  {
    m_testPointY = solidY;
    m_testPointX = mouse_x;
  }
  else
  {
    m_testPointY = undefined;
    m_testPointX = undefined;
  }
}

