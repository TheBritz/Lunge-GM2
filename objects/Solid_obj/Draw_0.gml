draw_sprite(sprite_index, image_index, x, y);

var blockArr
for(var i = 0; i < ds_list_size(m_drawList); i++)
{
  blockArr = m_drawList[|i];
  draw_sprite(sprite_index, blockArr[2], blockArr[0], blockArr[1]);  
}

