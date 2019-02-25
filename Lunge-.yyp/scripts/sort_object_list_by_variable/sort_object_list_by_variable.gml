/// @description This function sorts a given list of instances based on numeric values returned from a given function call
/// @argument numericalPropertyName
/// @argument variableName
/// @argument sortingOrder[optional]

enum SortingOrder
{
  Ascending = 1,
  Descending = -1
}

var list = argument[0];
var varName = argument[1];
var sortingOrder = SortingOrder.Ascending;
if(argument_count > 2)
{
  sortingOrder = argument[2];
}

if(ds_list_size(list) > 1)
{
  //Extreme value should be set to the first value
  var propertyValueExtreme = variable_instance_get(list[| 0], varName);

  var listSize = ds_list_size(list);
  var iMod = 0;
  var insertPosition = 0;
  for(var i = 0; i < listSize; i++)
  {
    var instance = list[| i + iMod];
    if(instance_exists(instance))
    {
      var value = variable_instance_get(instance, varName);
      if(sortingOrder == SortingOrder.Ascending)
      {
        if(value <= propertyValueExtreme)
        {
          //Put right at the front
          insertPosition = 0;          
        }
        else
        {
          //Seek for proper positioning
          for(var ii = 0; ii < i; ii++)
          {
            var instInner = list[| ii];
            var valInner = variable_instance_get(instInner, varName);
            if(value <= valInner)
            {
              break;
            }
            insertPosition = ii + 1;
          }
        }
      }
      else if(sortingOrder == SortingOrder.Descending)
      {
        if(value > propertyValueExtreme)
        {
          //Put right at the front
          insertPosition = 0;          
        }
        else
        {
          //Seek for proper positioning
          for(var ii = 0; ii < i; ii++)
          {
            var instInner = list[| ii];
            var valInner = variable_instance_get(instInner, varName);
            if(value >= valInner)
            {
              break;
            }
            insertPosition = ii + 1;
          }
        }
      }
      
      ds_list_insert(list, insertPosition, instance);
      iMod++;
    }
  }
  
  //Clean out old pre-sort values
  for(var i = listSize * 2 - 1; i >= listSize; i--)
  {
    ds_list_delete(list, i);
  }
}

