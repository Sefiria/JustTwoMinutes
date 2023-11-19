if(distance_to_object(obj_bulle) < 64)
{
	if(attack_cooldown == 0)
	{
		attack_cooldown = 50;
		if(attacking == 0)
		{
			attacking = 1;
			sprite_index = spr_pok_attack;
			image_index = 0;
		}
	}
}

if(attack_cooldown > 0)	attack_cooldown--;

if(sprite_index == spr_pok_attack and image_index >= sprite_get_number(spr_pok_attack) - 1)
{
	sprite_index = spr_pok_idle;
	image_index = 0;
}


if(attacking > 0)
{
	if(attacking == 41)
		attacking = 0;
	else
	if(attacking == 40)
	{
		attacking = 41;
		var _x = obj_bulle.x-x;
		var _y = obj_bulle.y-y;
		var _factor = 1/sqrt(sqr(_x)+sqr(_y));
		var _look = { x:_factor*_x, y:_factor*_y };
		instance_create_layer(x, y, "Instances", obj_pok_sword, {look : _look});
	}
	else attacking++;
}