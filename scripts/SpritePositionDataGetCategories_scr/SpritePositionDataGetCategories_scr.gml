/// @description
/// @param returnType[optional-CategoryReturnType]

var returnType = CategoryReturnType.CategoryList;

if(argument_count > 0)
{
  returnType = argument[0];
}

if(is_undefined(global.SpritePositionDataCategories))
{
  global.SpritePositionDataCategories = ds_map_create();
  global.SpritePositionDataCategoriesList = ds_list_create();
}

if(returnType == CategoryReturnType.CategoryList)
{
  return global.SpritePositionDataCategoriesList;
}
else if(returnType == CategoryReturnType.CategoryColorMap)
{
  return global.SpritePositionDataCategories;
}

enum CategoryReturnType
{
  CategoryList,
  CategoryColorMap
}