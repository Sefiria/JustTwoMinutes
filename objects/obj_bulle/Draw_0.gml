draw_sprite(sprite_index, image_index, x, y);

if(global.inventory[$ "bow"] >= 1)
{
	var _look = get_look(x, y, mouse_x, mouse_y);
	var _rot = point_direction(x, y, mouse_x, mouse_y);
	var _x = x + _look.x * 32;
	var _y = y + _look.y * 32
	draw_sprite_ext(spr_bow, 0, _x, _y, 1, 1, _rot, c_white, 1);
	if(attack_cooldown == 0 && global.inventory[$ "arrow"] > 0)
		draw_sprite_ext(spr_arrow, 0, _x, _y, 1, 1, _rot, c_white, 1);
}