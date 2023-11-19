function get_look(_ax, _ay, _bx, _by)
{
	var _x = _bx-_ax;
	var _y = _by-_ay;
	var _factor = 1/sqrt(sqr(_x)+sqr(_y));
	return { x:_factor*_x, y:_factor*_y };
}

function particles_create(_count = 10, _direction = 80)
{
	repeat(_count)
	{	
		var light_direction = _direction;
		var light_direction_increase = 0.25;
		var light_count = -10;
		part_sys = part_system_create_layer("Instances", 0);
		light = part_type_create();
		part_type_blend(light, true);
		part_type_life(light, 80, 160);
		part_type_sprite(light, spr_entrance_particle, true, false, false);
		part_type_size(light, 0.3, 0.48, -0.002, 0);
		part_type_alpha3(light, 0.1, 1, 0);
		part_type_speed(light, 0.2, 0.8, 0, 0);
		part_type_direction(light, light_direction - 30, light_direction + 30, light_direction_increase, 0.5);
		part_particles_create(part_sys, x, y, light, 1);
	}
}