if(state == "close" && distance_to_object(obj_bulle) < 50)
{
	var _self_asset_name = object_get_name(object_index);
	state = "anim";
	sprite_index = spr_white_chest_anim;
	audio_play_sound(snd_chest_open, 0, 0, 1, 0, 1);
	particles_create();
}