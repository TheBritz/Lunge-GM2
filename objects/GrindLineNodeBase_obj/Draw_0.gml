/// @description Insert description here
// You can write your code in this editor

if(instance_exists(m_nextNode))
{
	draw_line_width_color(x, y, m_nextNode.x, m_nextNode.y, 2, c_red, c_red);
}

draw_self();