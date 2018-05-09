/// @description roll_chance(chance, [optional] outOf)
/// @param chance The chance of a positive result out of 100 by default.
/// @param outOf Optional parameter to change the out-of value for the roll evaluation. Should be a whole number.

var chance = argument[0];
var outOf = 100;

if(argument_count > 1)
{
  outOf = argument[1];
}

var val = random(outOf);

return (val < chance);

