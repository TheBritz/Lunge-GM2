/// @description ConsoleValidateParameterObjectInstance_scr(value)
/// @param value

var value = argument0;
var valueNumber = ConsoleValidateParameterInt_scr(value); 
if(!is_undefined(valueNumber))
{ 
  if(instance_exists(valueNumber))
  {
    return valueNumber;
    exit;
  }
}

return undefined;

