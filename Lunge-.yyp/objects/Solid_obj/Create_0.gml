event_inherited();

depth = -100;
image_speed = 0;
image_index = irandom(sprite_get_number(sprite_index) - 1);
m_drawList = ds_list_create();

//Build up draw list
var blockArr;
var spriteWidth = sprite_get_width(sprite_index);
for(var i = 1; i < image_xscale; i++)
{
  blockArr = array(x + i*spriteWidth, y, 
    irandom(sprite_get_number(sprite_index) - 1)); 
  ds_list_add(m_drawList, blockArr);
}

var spriteHeight = sprite_get_height(sprite_index);
for(var i = 1; i < image_yscale; i++)
{
  blockArr = array(x, y + i*spriteHeight, 
    irandom(sprite_get_number(sprite_index) - 1)); 
  ds_list_add(m_drawList, blockArr); 
}



