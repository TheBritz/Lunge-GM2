/// @description PrintConsoleLine_scr(text)
/// @param text

var str;
if(argument_count == 1)
{
  str = argument[0];
}
else
{
  str = "";
}

with(global.Console)
{
  ds_list_add(m_consoleContent, str);
  m_bufferDraw = true;
}


