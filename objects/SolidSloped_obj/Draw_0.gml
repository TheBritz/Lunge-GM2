draw_self();
if(debug_mode && !is_undefined(m_testPointX))
{
  draw_set_colour(m_color);
  draw_point(m_testPointX, m_testPointY);
  draw_circle(m_testPointX, m_testPointY, 5, true);
}

