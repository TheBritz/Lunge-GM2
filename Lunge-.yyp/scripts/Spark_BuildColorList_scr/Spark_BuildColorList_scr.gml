/// @param baseColor
/// @param numberOfSegments
/// @param endValue
/// @param list[optional]

var baseColor = argument[0];
var numberOfSegments = argument[1];
var endValue = argument[2];
var endSat = argument[3];
var list;
if(argument_count > [4])
{
  list = argument[4];
}
else
{
  list = ds_list_create();
}

var baseHue = color_get_hue(baseColor);
var baseSat = color_get_saturation(baseColor);
var thisSat = baseSat;
var baseValue = color_get_value(baseColor);
var thisValue = baseValue;

var iterantValue = floor((endValue - baseValue)/numberOfSegments);
var iterantSat = floor((endSat - baseSat)/numberOfSegments);

var thisColor;
for(var i = 0; i < numberOfSegments; i++)
{
  thisColor = make_color_hsv(baseHue, thisSat, thisValue);
  ds_list_insert(list, 0, thisColor);
  thisValue += iterantValue;
  thisSat += iterantSat;
}

return list;


