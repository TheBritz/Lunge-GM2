/// @description InitKbdShiftMap_scr()

var shiftMap = ds_map_create();

shiftMap[? "`"] = "~";
shiftMap[? "1"] = "!";
shiftMap[? "2"] = "@";
shiftMap[? "3"] = "#";
shiftMap[? "4"] = "$";
shiftMap[? "5"] = "%";
shiftMap[? "6"] = "^";
shiftMap[? "7"] = "&";
shiftMap[? "8"] = "*";
shiftMap[? "9"] = "(";
shiftMap[? "0"] = ")";
shiftMap[? "-"] = "_";
shiftMap[? "="] = "+";
shiftMap[? "["] = "{";
shiftMap[? "]"] = "}";
shiftMap[? "\\"] = "|";
shiftMap[? ";"] = ":";
shiftMap[? "'"] = "\"";
shiftMap[? ","] = "<";
shiftMap[? "."] = ">";
shiftMap[? "/"] = "?";

return shiftMap;

