/// @description
/// @param sprite
/// @param categoryList[optional]
/// @param surf[optional]

var sprite = argument[0];
var spriteWidth = sprite_get_width(sprite);
var spriteHeight = sprite_get_height(sprite);
var offsetX = sprite_get_xoffset(sprite);
var offsetY = sprite_get_yoffset(sprite);

var categoryList = SpritePositionDataGetCategories_scr
  (CategoryReturnType.CategoryList); 
if(argument_count > 1)
{
  categoryList = argument[1];
}
var catListSize = ds_list_size(categoryList); 

var surf;
var freeSurf = false;
if(argument_count > 2)
{
  surf = argument[2];
}
else
{
  surf = surface_create(spriteWidth, spriteHeight);
  freeSurf = true;
}


surface_set_target(surf);

for(var iFrame = 0; iFrame < sprite_get_number(sprite); iFrame++)
{
  draw_clear(c_black);
  draw_sprite(sprite, iFrame, offsetX, offsetY);
  for(var ix = 0; ix < spriteWidth; ix++)
  {
    for(var iy = 0; iy < spriteHeight; iy++)
    {
      var col = surface_getpixel(surf, ix, iy);
    
      for(var i = 0; i < catListSize; i++)
      {
        var category = categoryList[|i];
        var catCol = SpritePositionDataGetCategoryColor_scr(category);
        if(col == catCol)
        {
          SpritePositionDataAddData_scr(sprite, category, iFrame, ix, iy);
        }
      }
    }
  }
}

if(freeSurf)
{
  surface_free(surf);
}
