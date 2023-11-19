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

function instances_get(_type)
{
	var _instances = [];
	for (var i = 0; i < instance_number(_type); ++i;)
	{
		array_push(_instances, instance_find(_type, i));
	}
	return _instances;
}

function is_tags_near(_tags, _distance)
{
	var _assets = instances_get(obj_chest);
	var _scope={distance:_distance};
	function _func(_id){ var _p = asset_get_index("obj_bulle"); var _d = point_distance(_p.x, _p.y, _id.x, _id.y); return _d < distance; };
	return array_any(_assets, method(_scope,_func));
}
function is_chest_near(_distance)
{
	return is_tags_near("chest", _distance);
}

function inventory_get_items(_item_type)
{
	var _items = [];
	for(var i=0; i<ds_map_size(global.inventory); i++)
	{
		if(global.inventory[i].type == _item_type)
			array_push(_items, global.inventory[i]);
	}
	return _items;
}

function draw_def(_color, _alpha)
{
	draw_set_color(_color);
	draw_set_alpha(_alpha);
}
function draw_default()
{
	draw_set_color(c_white);
	draw_set_alpha(1);
}