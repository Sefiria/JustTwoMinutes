function create_inv()
{
	if(!struct_exists(global, "inventory"))
		global.inventory = ds_map_create();
	if(!ds_map_exists(global.inventory, "coins"))
		ds_map_add(global.inventory, "coins", {name:"coins",count:0,type:ITEM_TYPES.OTHER});
}

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
	var size = ds_map_size(global.inventory);
	var key = ds_map_find_first(global.inventory);
	var value = inv_get(key);
	for (var i = 0; i < size; i++;)
	{
		if(value.type == _item_type)
			array_push(_items, value);
	    key = ds_map_find_next(global.inventory, key);
		value = inv_get(key);
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

function inv_get(_item_name) { return ds_map_find_value(global.inventory, _item_name); }
function inv_count(_item_name, _count) { return ds_map_exists(global.inventory, _item_name) && inv_get(_item_name).count > _count; }
function inv_has(_item_name) { return inv_count(_item_name, 0); }
function inv_has_all(_items_name) { return array_all(_items_name, function(element, index){ return inv_count(element, 0); }); }
function inv_decr(_item_name) { if(inv_has(_item_name)) { inv_get(_item_name).count--; if(!inv_has(_item_name)) ds_map_delete(global.inventory, _item_name); } }
function inv_incr(_item_name) { if(inv_has(_item_name)) inv_get(_item_name).count++; }
function inv_add(_item)
{
	if(!ds_map_exists(global.inventory, _item.name))
		ds_map_add(global.inventory, _item.name, _item);
	else
		global.inventory[$ _item.name].count += _item.count;
}

function array_append(array, element){array[array_length(array)] = element;}
function structs_equals(s1, s2)
{
	if(s1 == undefined && s2 == undefined) return true;
	if(s1 == undefined || s2 == undefined) return false;
	var keys1 = variable_struct_get_names(s1);
	var keys2 = variable_struct_get_names(s2);
	if(!array_equals(keys1, keys2))
		return false;
	for (var i = array_length(keys1)-1; i >= 0; --i) {
	    var k1 = keys1[i];
	    var k2 = keys2[i];
	    var v1 = s1[$ k1];
	    var v2 = s2[$ k2];
	    if(v1 != v2)
			return false;
	}
	return true;
}