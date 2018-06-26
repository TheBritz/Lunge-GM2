/// @description
/// @param filterMatch
/// @param filterAvoid
/// @param colorCategoryArray

var filterMatch = argument[0];
var filterAvoid = argument[1];

if(argument_count > 2)
{
  var catList = argument[2];
  for(var i = 0; i < array_length_1d(catList); i++)
  {
    var catArr = catList[i];
    if(is_array(catArr))
    {
      SpritePositionDataAddCategory_scr(catArr[0], catArr[1]);
    }
  }
}

var index = 0;

while(sprite_exists(index))
{
  var spriteName = sprite_get_name(index);
  if(is_undefined(filterMatch) || string_pos(filterMatch, spriteName) != 0)
  {
    if(is_undefined(filterAvoid) || string_pos(filterAvoid, spriteName) == 0)
    {
      SpritePositionDataScanSprite_scr(index);
    }
  }
  
  index++;
}