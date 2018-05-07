/// @description choose_weighted(option1, weight1, option2, weight2, ...)
/// @param option1
/// @param  weight1
/// @param  option2
/// @param  weight2
/// @param  ...

var option, weight, selected;
var total = 0;
for (i=0; i < argument_count; i+=2)
{
  if(argument_count > i + 1)
  {
    weight = argument[i + 1];
  }
  else
  {
    weight = 1;
  }  
  total += weight;
}

var rand = irandom_range(1, total);

total = 0;
for (i=0; i < argument_count; i+=2)
{
  option = argument[i];
  if(argument_count > i + 1)
  {
    weight = argument[i + 1];
  }
  else
  {
    weight = 1;
  }  
  
  if(total + weight > rand)
  {
    selected = option[i];
  }
  else
  {
    total += weight;  
  }
}


