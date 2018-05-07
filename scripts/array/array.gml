/*********************************************************
-Summary-

    array()
**********************************************************
-Description-

    Takes a series of values and returns them as a
    1-dimensional array.
**********************************************************
-Returns-

    An array of values
**********************************************************
-Parameters-

    val0...val15
    
    Up to 16 values can be passed in to form a 
    1-dimensional array.
**********************************************************
-Example-

    var example_arr = array(1,2,3,4,5);
    
    This example returns 5-member 1-dimensional array
    with the values 1-5 occupying the 0-4 positions.
*********************************************************/

var ret_arr;
for(var i = 0; i < argument_count; i++;)
{
  ret_arr[i] = argument[i];
}

return ret_arr;
