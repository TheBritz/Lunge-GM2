/// @description PlayerSpear Init
m_wielder = noone;
m_strikeTimer = -1;
m_canDetonate = true;
m_chargeToDetonate = 100;
m_charge = m_chargeToDetonate;
m_chargeMax = m_chargeToDetonate;
m_isLunging = false;
m_strikeTime = 6;
m_targetType = Enemy_obj;
m_skeweredEnemies = ds_list_create();
mask_index = HitboxPlayerSpear_spr;
m_skewerHitbox = HitboxPlayerSpear_spr;
m_skewerPosX = sprite_width - sprite_xoffset - 12;
m_skewerPosY = 0;
m_imbedPosX = sprite_width - sprite_xoffset - 3;
m_imbedPointX = undefined;
m_imbedPointY = undefined;
m_imbedHitbox = HitboxPlayerSpearImbed_spr;

