///@param attackSprite

var attackSprite = argument0;

//Range is the distance from the x origin to the edge of the sprite
var width = sprite_get_width(attackSprite);
var offsetX = sprite_get_xoffset(attackSprite);

return width - offsetX;