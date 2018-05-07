/// @description ParseConsoleCommand_scr(command)
/// @param command

var cmd = argument0;

//Capture this command to the command history
if(m_historyIndex == -1 || m_consoleHistory[| m_historyIndex] != cmd)
{
  ds_list_add(m_consoleHistory, cmd);
}

//Print this call to the console
PrintConsoleLine_scr(cmd);

//Split the call from the arguments
var arr = split(cmd, "(");

if(array_length_1d(arr) == 2)
{
  //Clean the arguments
  var args = arr[1];
  var argsLen = string_length(args);
  //Get rid of the trailing ')'
  args = string_delete(args, argsLen, 1);
  var argArr = split(args, ",");
  
  ExecuteConsoleCommand_scr(arr[0], argArr);
}



