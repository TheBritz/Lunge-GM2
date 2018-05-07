/// @description ConsoleDeleteObjectInstancesOfType_scr(objectIndex)
/// @param objectIndex

var index = argument0;
var i = 0;
with(index)
{
  instance_destroy();
  i++;
}

var objName = object_get_name(index);
PrintConsoleLine_scr("Deleted " + string(i) + " instances of " + objName + ".");

