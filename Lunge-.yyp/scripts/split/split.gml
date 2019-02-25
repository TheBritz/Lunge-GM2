/// @description split(string, separator)
/// @param string
/// @param  separator
/*
Usage:
    array = strip(str,sep);

Arguments:
    str     The string that will be "split" into an array
    sep     The string delimiter

Returns:
    arr     The array that was split from the string
    
Notes:
    Converts a string of values separated by a delimiter
    to an array format.
*/

var str, arr, sep, pos, count;
ind = 0;
sep = argument1;
str = argument0 + sep;
count = string_count(sep,str);

for(var i = 0; i < count; i++)
{
    pos = string_pos(sep,str);
    arr[i] = string_copy(str,0,pos - 1);
    str = string_delete(str,1,pos);   
}

return(arr);
