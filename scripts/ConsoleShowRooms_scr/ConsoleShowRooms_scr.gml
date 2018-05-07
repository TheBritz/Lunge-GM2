/// @description ConsoleShowRooms_scr()

PrintConsoleLine_scr("Valid room names that can be used with GoToRoom:");
PrintConsoleLine_scr();
for(var i = 0; i < 1000; i++)
{
  var roomName = room_get_name(i);
  if(!is_undefined(roomName) && roomName != "<undefined>")
  {
    PrintConsoleLine_scr(roomName);  
  }
}

