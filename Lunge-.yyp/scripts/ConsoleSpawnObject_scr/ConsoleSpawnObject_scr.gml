/// @description ConsoleSpawnObject_scr(index, number [optional], separation [optional])
/// @param index
/// @param  number [optional]
/// @param  separation [optional]

var index = argument[0];
var number = 1;
if(argument_count > 1)
{
  number = argument[1];
}

var sep = 1;
if(argument_count > 2)
{
  sep = argument[2];
}

var name = object_get_name(index);
PrintConsoleLine_scr("Creating " + string(number) + " instances of object: " + name);
var xx = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2;
var yy = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2;
for(var i = 0; i < number; i++)
{
  instance_create(xx, yy, index);
  xx += sep;
  yy += sep;
}


