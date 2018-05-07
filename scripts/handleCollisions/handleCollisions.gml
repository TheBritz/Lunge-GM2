/*// Handle sub-pixel movement
cx += velocityX;
cy += velocityY;
roundedVelocityX = round (cx);
roundedVelocityY = round (cy);
cx -= roundedVelocityX;
cy -= roundedVelocityY;

var velocityYIndex = abs (roundedVelocityY);

if (velocityYIndex == 0)
    velocityYIndex = 1;

// Vertical Movement
repeat (velocityYIndex)
{
    if (place_meeting (x, y + sign (roundedVelocityY), obj_solid))
    {
        velocityY = 0; 
        onPlatform = false; 
    } 
        
    if (!place_meeting (x, y + sign (roundedVelocityY), obj_solid)
     && !platformIsBelow()                                       )
    {
        y += sign (roundedVelocityY);
        onPlatform = false; 
    }
        
    if (!place_meeting (x, y + sign (roundedVelocityY), obj_solid)
     && platformIsBelow()                                        )
    {
        if (roundedVelocityY < 0
         || platformDrop        )
        {
            y += sign (roundedVelocityY);
            onPlatform = false; 
        }
        else 
        {
            velocityY = 0;
            onPlatform = true;
        }
    }
}

// Horizontal Movement
repeat (abs (roundedVelocityX)) 
{
    // Move up slope
    if (place_meeting (x + sign (roundedVelocityX), y, obj_solid) 
    && !place_meeting (x + sign (roundedVelocityX), y - 1, obj_solid))
        --y;
    
    // Move down slope
    if (!place_meeting (x + sign (roundedVelocityX), y, obj_solid) 
     && !place_meeting (x + sign (roundedVelocityX), y + 1, obj_solid) 
      && place_meeting (x + sign (roundedVelocityX), y + 2, obj_solid))
        ++y; 

    // Move horizontally
    if (!place_meeting (x + sign (roundedVelocityX), y, obj_solid))
        x += sign (roundedVelocityX); 
    else 
    {
        velocityX = 0;
        break;
    }
}
