/// @description ExecuteConsoleCommand_scr(command, argArr)
/// @param command
/// @param  argArr

var cmd = argument0;
var argArr = argument1;

//Get the command index
if(ds_map_exists(m_commandMap, cmd))
{
  var cmdIndex = m_commandMap[? cmd];
  argArr = ValidateArgs_scr(cmd, argArr, m_errorList, m_warningList);
  //Print any warnings first
  if(ds_list_size(m_warningList) > 0)
  {
    if(ds_list_size(m_errorList) == 0)
    {
      PrintConsoleLine_scr("Warning: Console command executing with the warnings below.");
    }
    
    for(var i = 0; i < ds_list_size(m_warningList); i++)
    {
      PrintConsoleLine_scr(m_warningList[|i]);
    }
  }
  
  //Only run if we don't have any errors
  if(ds_list_size(m_errorList) == 0)
  {
    var argCount = array_length_1d(argArr);
    
    switch(argCount)
    {
      case 0:
        script_execute(cmdIndex);
        break;
      
      case 1:
        script_execute(cmdIndex, argArr[0]);
        break;
        
      case 2:
        script_execute(cmdIndex, argArr[0], argArr[1]);
        break;
        
      case 3:
        script_execute(cmdIndex, argArr[0], argArr[1], argArr[2]);
        break;
        
      case 4:
        script_execute(cmdIndex, argArr[0], argArr[1], argArr[2], argArr[3]);
        break;
        
      case 5:
        script_execute(cmdIndex, argArr[0], argArr[1], argArr[2], argArr[3], argArr[4]);
        break;
        
      case 6:
        script_execute(cmdIndex, argArr[0], argArr[1], argArr[2], argArr[3], argArr[4], argArr[5]);
        break;
      
      case 7:
        script_execute(cmdIndex, argArr[0], argArr[1], argArr[2], argArr[3], argArr[4], argArr[5], argArr[6]);
        break;
        
      case 8:
        script_execute(cmdIndex, argArr[0], argArr[1], argArr[2], argArr[3], argArr[4], argArr[5], argArr[6], argArr[7]);
        break;
        
      case 9:
        script_execute(cmdIndex, argArr[0], argArr[1], argArr[2], argArr[3], argArr[4], argArr[5], argArr[6], argArr[7], argArr[8]);
        break;
       
      case 10:
        script_execute(cmdIndex, argArr[0], argArr[1], argArr[2], argArr[3], argArr[4], argArr[5], argArr[6], argArr[7], argArr[8], argArr[9]);      
        break;
    }  
  }
  else
  {
    PrintConsoleLine_scr("Error: The command could not be executed because one or more parameters were missing or invalid:");
    for(var i = 0; i < ds_list_size(m_errorList); i++)
    {
      PrintConsoleLine_scr(m_errorList[| i]);
    }
  }
}


