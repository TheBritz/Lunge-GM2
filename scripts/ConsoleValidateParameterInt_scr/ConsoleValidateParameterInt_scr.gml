/// @description ConsoleValidateParameterInt_scr(value)
/// @param value

var value = argument0;
var digits = string_replace_all(value, " ", "");
var valueConverted = real(digits);

if(!(value == 0 && digits != "0" && digits != "0.0")) 
{
  return valueConverted;
}
else
{
  //Value is not valid; return undefined
  return undefined;   
}

