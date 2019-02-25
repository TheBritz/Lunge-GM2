/// @description Draw hitbox
if(global.ShowHitboxes && sprite_exists(mask_index))
{
  draw_sprite_ext(mask_index, image_index, x, y, 
    image_xscale, image_yscale, image_angle, -1, image_alpha);
}

