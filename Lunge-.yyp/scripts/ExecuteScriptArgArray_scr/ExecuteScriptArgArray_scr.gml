/// @description ExecuteScriptArgArray_scr(script, args)
/// @param script
/// @param  args

var script = argument0;
var argArr = argument1;
if(!is_undefined(argArr) && is_array(argArr))
{
  var argCount = array_length_1d(argArr);
      
  switch(argCount)
  {
    case 0:
      script_execute(script);
      break;
    
    case 1:
      script_execute(script, argArr[0]);
      break;
      
    case 2:
      script_execute(script, argArr[0], argArr[1]);
      break;
      
    case 3:
      script_execute(script, argArr[0], argArr[1], argArr[2]);
      break;
      
    case 4:
      script_execute(script, argArr[0], argArr[1], argArr[2], argArr[3]);
      break;
      
    case 5:
      script_execute(script, argArr[0], argArr[1], argArr[2], argArr[3], argArr[4]);
      break;
      
    case 6:
      script_execute(script, argArr[0], argArr[1], argArr[2], argArr[3], argArr[4], argArr[5]);
      break;
    
    case 7:
      script_execute(script, argArr[0], argArr[1], argArr[2], argArr[3], argArr[4], argArr[5], argArr[6]);
      break;
      
    case 8:
      script_execute(script, argArr[0], argArr[1], argArr[2], argArr[3], argArr[4], argArr[5], argArr[6], argArr[7]);
      break;
      
    case 9:
      script_execute(script, argArr[0], argArr[1], argArr[2], argArr[3], argArr[4], argArr[5], argArr[6], argArr[7], argArr[8]);
      break;
     
    case 10:
      script_execute(script, argArr[0], argArr[1], argArr[2], argArr[3], argArr[4], argArr[5], argArr[6], argArr[7], argArr[8], argArr[9]);      
      break;
  }
}
else
{
  script_execute(script);
}

