/// @description SpritePositionDataAddCategory_scr
/// @param categoryName
/// @param categoryColor

var categoryName = argument0;
var categoryColor = argument1;

var categoryMap = 
  SpritePositionDataGetCategories_scr(CategoryReturnType.CategoryColorMap);

categoryMap[? categoryName] = categoryColor;
ds_list_add(global.SpritePositionDataCategoriesList, categoryName);