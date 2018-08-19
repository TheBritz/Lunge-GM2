var xx = argument[0];
var yy = argument[1];
var sparkType = argument[2];

if(object_is(sparkType, SparkBase_obj))
{
  var colorList;
  var isUniqueColorList = false;
  if(argument_count > 3)
  {
    colorList = argument[3];
  }
  else
  {
    colorList = ds_list_create();
    isUniqueColorList = true;
  }

  var spark = instance_create(xx, yy, sparkType);
}