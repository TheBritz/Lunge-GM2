/// @description
/// @param sprite
/// @param categoryList[optional]

var sprite = argument[0];

var categoryList = SpritePositionDataGetCategories_scr
  (CategoryReturnType.CategoryList); 
 
if(argument_count > 1)
{
  categoryList = argument[1];
}
var catListSize = ds_list_size(categoryList); 

var spriteWidth = sprite_get_width(sprite);
var spriteHeight = sprite_get_height(sprite);

for(var ix = 0; ix < spriteWidth; ix++)
{
  for(var iy = 0; iy < spriteHeight; iy++)
  {
    var col = draw_getpixel_ext(ix, iy);
    
    for(var i = 0; i < catListSize; i++)
    {
      var category = categoryList[|i];
      var catCol = SpritePositionDataGetCategoryColor_scr(category);
      if(col == catCol)
      {
        var key = SpritePositionDataBuildCategoryKey_scr(sprite, category);
      }
    }
  }
}

