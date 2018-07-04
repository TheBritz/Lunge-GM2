//Use the code below as a starting point to add a console command. The 
//console object uses script naming to identify additional commands. Use the 
//following pattern to allow the console object to identify your command:
//[optional prefix]Console_Command_<CommandName>[optional suffix]
//
//Examples:
//
//Console_Command_ShowRooms_scr  (Will appear as 'ShowRooms' in console)
//scr_Console_Command_SpawnObject  (Will appear as 'SpawnObject in console)
//Console_Command_GoToRoom  (Will appear as 'GoToRoom' in console)
//
//NOTE: prefix and suffix are set to 'scr_' and '_scr' respectively by default,
//      if you wish to use a different scheme, you will need to call set the
//      m_prefix and/or m_suffix object variables in the 'ConsoleInitExt_scr'
//      script

//Console commands can be run two different ways:
//1. When the console object needs to retrieve metadata about a command. 
//2. When the user is running the command through the console.
var runType = argument[0];

if(runType == ConsoleScriptRunType.Metadata)
{
  //Supply metadata through the given ds_map
  var metadata = argument[1];
  
  //-Description- 
  //This will appear in the console intellisense and should describe what the 
  //command will do
  metadata[? ConsoleMetadata.Description] = "The description of this command.";
  
  //-Parameters-
  //This piece of metadata will serve two purposes:
  //1. Show the user through intellisense what parameters they should be 
  //   passing into the command
  //2. Define the types of parameters that should be passed-in to the command.
  //   Console ParameterTypes are defined by adding 
  //   Console_ParameterType_<TypeName> scripts. See 
  //   ConsoleParameterTypeTemplate for details about creating parameter types.
  //Pattern: <ParameterType1> <parameterName1>, <ParameterType2> <parameterName2>, ...
  metadata[? ConsoleMetadata.Parameters] = "Room roomName, ObjectType objectType, Int number, String example";
}
else if(runType == ConsoleScriptRunType.Command)
{
  //Run the actual command
}
