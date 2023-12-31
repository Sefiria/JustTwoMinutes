function shot()
{
	if(inv_has_all(["bow","arrow"]))
	{
		instance_create_layer(x, y, "Instances", obj_arrow, {owner:self, look : get_look(x, y, mouse_x, mouse_y)});
		audio_play_sound(snd_bow_pull, 0, 0, 1, 0, 1);
		inv_decr("arrow");
	}
	else
	{
		instance_create_layer(x, y, "Instances", obj_bulle_sword, {look : get_look(x, y, mouse_x, mouse_y)});
	}
}


if(attack_cooldown == 0)
{
	if(mouse_check_button(mb_left) and global.mb_left_r
	&& !is_chest_near(68)
	&& global.hotslots.no_over()
	&& !global.hold_control)
	{
		sprite_index = spr_bulle_attack;
		image_index = 0;
		shot();
		attack_cooldown = 25;
	}
}
else
{
	attack_cooldown--;
	if(attack_cooldown == 1 && inv_has_all(["bow","arrow"])) 
		audio_play_sound(snd_bow_loading, 0, 0, 1, 0, 1);
	if(attack_cooldown < 0) attack_cooldown = 0;
}

if(sprite_index == spr_bulle_attack and image_index >= sprite_get_number(spr_bulle_attack) - 1)
	sprite_index=spr_bulle_idle;

global.mb_left_r = !mouse_check_button(mb_left);

global.hold_control = keyboard_check(vk_control);