function shot()
{
	if(!array_any(tag_get_assets("chest"), function(_id){return distance_to_object(asset_get_index(_id)) < 50;}))
	{
		if(global.inventory[$ "bow"] > 0 && global.inventory[$ "arrow"] > 0)
		{
			instance_create_layer(x, y, "Instances", obj_arrow, {owner:self, look : get_look(x, y, mouse_x, mouse_y)});
			audio_play_sound(snd_bow_pull, 0, 0, 1, 0, 1);
			global.inventory[$ "arrow"]--;
		}
		else
		{
			instance_create_layer(x, y, "Instances", obj_bulle_sword, {look : get_look(x, y, mouse_x, mouse_y)});
		}
		return true;
	}
	return false;
}


if(attack_cooldown == 0)
{
	if(mouse_check_button(mb_left) and global.mb_left_r)
	{
		sprite_index = spr_bulle_attack;
		image_index = 0;
		
		if(shot())
			attack_cooldown = 25;
	}
}
else
{
	attack_cooldown--;
	if(attack_cooldown == 1 && global.inventory[$ "bow"] >= 1 && global.inventory[$ "arrow"] > 0) 
		audio_play_sound(snd_bow_loading, 0, 0, 1, 0, 1);
	if(attack_cooldown < 0) attack_cooldown = 0;
}

if(sprite_index == spr_bulle_attack and image_index >= sprite_get_number(spr_bulle_attack))
	sprite_index=spr_bulle_idle;

global.mb_left_r = !mouse_check_button(mb_left);



