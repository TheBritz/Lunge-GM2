depth = 100;
image_alpha = 1;
image_speed = 0;
image_index = irandom(sprite_get_number(sprite_index) - 1);
m_drawList = ds_list_create();
m_wallBase = WallBaseBig_spr;

//Build up draw list
var blockArrX, bloackArrY;
var spriteWidth = sprite_get_width(sprite_index);
var spriteHeight = sprite_get_height(sprite_index);
for(var iX = 0; iX < image_xscale; iX++)
{ 
  for(var i = 0; i < image_yscale; i++)
  {
    if(i != 0 || iX != 0)
    {
      blockArr = array(x + iX*spriteWidth, y + i*spriteHeight, 
        irandom(sprite_get_number(sprite_index) - 1)); 
      ds_list_add(m_drawList, blockArr); 
    }
  }
}






