
// Draw the HUD coin sprite
draw_sprite(spr_hud_coin, 0, 1080, 10);

// Change the font to ft_hud
draw_set_font(fnt_hud);

// Draw the player's coins value
// Taken from the player
// using obj_player.coins
draw_text(1135, 15, "  " + string(global.inventory[$ "coins"]));