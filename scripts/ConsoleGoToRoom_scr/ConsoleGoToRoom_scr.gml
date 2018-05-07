/// @description ConsoleGoToRoom(room)
/// @param room

var rm = argument0;

if(rm != -1)
{
  room_goto(rm);
  var roomName = room_get_name(rm);
  PrintConsoleLine_scr("Going to room: " + roomName);
}




