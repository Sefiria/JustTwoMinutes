function draw_ui_init()
{	
	global.hotslots = new SlotContainer([new Slot("weapon", 0), new Slot("armor", 1), new Slot("potion", 2)]);

	//var _slots = [];
	//for(var j=0;j<4;j++)
	//{
	//	for(var i=0;i<4;i++)
	//	{
	//		var _index = i + j * 4;
	//		_slots[_index] = new Slot("inv-"+string(i)+"-"+string(j),{i:i,j:j}, 1);
	//	}
	//}
	//global.slots = new SlotContainer(_slots);
}

function draw_ui() 
{
	for(var i=0; i<global.hotslots.length(); i++)
	{
		var _slot = global.hotslots.objects[i];
		if(_slot.is_mouse_over())
			draw_sprite(spr_ui_slot, 0, _slot.x, _slot.y);
		else
			draw_sprite_ext(spr_ui_slot, 0, _slot.x, _slot.y, 1, 1, 0, c_white, 0.5);
	}
	
	if(global.hold_control)
		draw_ui_inventory();
}

function draw_ui_inventory()
{
	//for(var i=0; i<global.slots.length(); i++)
	//{
	//	var _slot = global.slots.objects[i];
	//	if(_slot.is_mouse_over())
	//		draw_sprite(spr_ui_slot, 0, _slot.x, _slot.y);
	//	else
	//		draw_sprite_ext(spr_ui_slot, 0, _slot.x, _slot.y, 1, 1, 0, c_white, 0.5);
	//}
	
	draw_def(c_black, 0.33);
	draw_rectangle(0, 0, window_get_width(), window_get_height(), false);
	draw_default();
	
	var i; var _item; var _length;
	var _x = 0; var _y = 10; var _ofs = 30; var _long = 0;
	function show(_list, _color)
	{
		for(i=0;i<array_length(_list); i++)
		{
			_item = _list[i];
			_length = string_length(_item.name);
			if(_length > _long) _long = _length;
			draw_text_color(_x, _y * _ofs, _item.name, _color, _color, _color, _color, 1);
			_y++;
			if(_y +_ofs >= window_get_height())
			{
				_x += _long + _ofs;
				_y = 10;
			}
		}
	}
	//show_debug_message(array_length(inventory_get_items(ITEM_TYPES.WEAPON)));
	//show_debug_message(array_length(inventory_get_items(ITEM_TYPES.ARMOR)));
	//show_debug_message(array_length(inventory_get_items(ITEM_TYPES.POTION)));
	//show_debug_message(array_length(inventory_get_items(ITEM_TYPES.MUNITION)));
	//show_debug_message(array_length(inventory_get_items(ITEM_TYPES.OTHER)));
	show(inventory_get_items(ITEM_TYPES.WEAPON), c_yellow);
	show(inventory_get_items(ITEM_TYPES.ARMOR), c_blue);
	show(inventory_get_items(ITEM_TYPES.POTION), c_green);
	show(inventory_get_items(ITEM_TYPES.MUNITION), c_gray);
	show(inventory_get_items(ITEM_TYPES.OTHER), c_white);
}