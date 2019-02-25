/// @description relative_coordinates(xOrigin, yOrigin, xShift, yShift, angle)
/// @param xOrigin
/// @param  yOrigin
/// @param  xShift
/// @param  yShift
/// @param  angle
/*********************************************************
-Summary-

    relative_coordinates()
**********************************************************
-Description-

    This script returns the x and y coodinate
    representative of a given x and y shift for a given
    angle. It treats the given angle as the X axis. This
    is generally useful to find where attached parts
    would go on an parent object. Think turrets on a
    spaceship.   
**********************************************************
-Returns-

    A 2 member array of ints
    [0] = x_coord
    [1] = y_coord
**********************************************************
-Parameters-

    x_orig (int)
        The x origin point (To shift from)
    
    y_orig (int)
        The y origin point (To shift from)
    
    x_shift (int)
        The value to shift by along the angled x axis
        
    y_shift (int)
        The value to shift by along the angled y axis
        
    angle (int)
        The angle to shift the grid by
**********************************************************
-Example-
    
    with(player_obj)
    {
        var coords = relative_coordinates(x, y, 20, 40, image_angle);
    }
    
    This example would find the point that is visually
    at the coordinate ( 20, 40 ) of the player_obj's 
    sprite, even if the player is rotated by the value
    contained in image_angle.
*********************************************************/

var x_orig = argument0;
var y_orig = argument1;
var x_shift = argument2;
var y_shift = argument3;
var angle = argument4;

var ret;
ret[0] = x_orig + lengthdir_x(x_shift,angle) + lengthdir_x(y_shift,angle - 90);
ret[1] = y_orig + lengthdir_y(y_shift,angle - 90) + lengthdir_y(x_shift,angle);

return(ret);
