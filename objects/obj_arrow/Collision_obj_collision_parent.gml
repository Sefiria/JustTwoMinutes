if (!(instance_place(xprevious, y, [obj_collision_parent]) > 0)
|| !(instance_place(x, yprevious, [obj_collision_parent]) > 0))
{
	end_path = true;
	audio_play_sound(snd_arrow_impact, 0, 0, 1, 0, 1);
}