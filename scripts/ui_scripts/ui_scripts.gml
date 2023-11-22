function draw_ui_init()
{	
	global.hotslots = new SlotContainer([new Slot("weapon", 0), new Slot("munition", 1), new Slot("armor", 2), new Slot("potion", 3)]);
	global.ui= {inv_items_rect:[],rect_obj:undefined,index_ofs:{x:0,y:0}};

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

var ;

function draw_ui() 
{
	for(var i=0; i<global.hotslots.length(); i++)
	{
		var _slot = global.hotslots.objects[i];
		var _image = _slot.content != undefined ? sprbank_get(_slot.content.name) : undefined;
		if(_slot.is_mouse_over())
		{
			draw_sprite(spr_ui_slot, 0, _slot.x, _slot.y);
			if(_slot.content != undefined)	draw_sprite_stretched(_image, 0, _slot.x-_slot.w*0.45, _slot.y-_slot.h*0.45, _slot.w*0.9, _slot.h*0.9);
		}
		else
		{
			draw_sprite_ext(spr_ui_slot, 0, _slot.x, _slot.y, 1, 1, 0, c_white, 0.5);
			if(_slot.content != undefined)	draw_sprite_stretched_ext(_image, 0, _slot.x-_slot.w*0.45, _slot.y-_slot.h*0.45, _slot.w*0.9, _slot.h*0.9, c_white, 0.5);
		}
		if(_slot.content != undefined && _slot.content.type == ITEM_TYPES.MUNITION)
		{
			var c = _slot.content.count > 10 ? c_lime : (_slot.content.count > 5 ? c_yellow : (_slot.content.count > 3 ? c_orange : c_red));
			draw_text_color(_slot.x, _slot.y - _slot.h/2 - 10, _slot.content.count, c,c,c,c,1);
		}
	}
	
	if(global.hold_control)
		draw_ui_inventory();
		
	draw_ui_dragndrop();
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
	
	global.ui.inv_items_rect = [];
	var _length = 0;
	var _x = 0;
	var _y = 0;
	var _ofs = 30;
	var _long = 0;
	var _scope = {length:_length,x:_x,y:_y,ofs:_ofs,long:_long}
	function show(_list, _color, scope)
	{
		for(var i=0;i<array_length(_list); i++)
		{
			var _item = _list[i];
			if(global.ui.rect_obj != undefined && global.ui.rect_obj.item == _item)
				continue;
			var _length = string_length(_item.name);
			if(_length > scope.long) scope.long = _length;
			var _str = _item.name+":"+string(_item.count);
			draw_text_color(10 + scope.x, 10 + scope.y * scope.ofs, _str, _color, _color, _color, _color, 1);
			array_append(global.ui.inv_items_rect, {x:10 + scope.x, y:10 + scope.y * scope.ofs, w:string_width(_str), h:string_height(_str), item:_item, color:_color});
			scope.y++;
			if(scope.y +scope.ofs >= window_get_height())
			{
				scope.x += scope.long + scope.ofs;
				scope.y = 10;
			}
		}
	}
	show(inventory_get_items(ITEM_TYPES.WEAPON), c_yellow, _scope);
	show(inventory_get_items(ITEM_TYPES.ARMOR), c_blue, _scope);
	show(inventory_get_items(ITEM_TYPES.POTION), c_green, _scope);
	show(inventory_get_items(ITEM_TYPES.MUNITION), c_gray, _scope);
	show(inventory_get_items(ITEM_TYPES.OTHER), c_white, _scope);
	
	
	if(global.ui.rect_obj != undefined)
	{
		var _r = global.ui.rect_obj;
		var _str = _r.item.name+":"+string(_r.item.count);
		var _c = _r.color;
		draw_text_color(mouse_x - global.ui.index_ofs.x, mouse_y - global.ui.index_ofs.y, _str, _c, _c, _c, _c, 1);
	}
}

function draw_ui_dragndrop()
{
	if(global.hold_control)
	{
		if(mouse_check_button(mb_left))
		{
			if(global.ui.rect_obj == undefined)
			{
				var _id = array_find_index(global.ui.inv_items_rect, function(e){return rect_contains_mouse(e);});
				if(_id > -1)
				{
					global.ui.rect_obj = global.ui.inv_items_rect[_id];
					global.ui.index_ofs.x = mouse_x - global.ui.rect_obj.x;
					global.ui.index_ofs.y = mouse_y - global.ui.rect_obj.y;
				}
			}
		}
		else
		{
			if(global.ui.rect_obj != undefined)
			{
				var _id = array_find_index(global.hotslots.objects, function(e){return e.is_mouse_over();});
				if(_id > -1)
					global.hotslots.objects[_id].content = global.ui.rect_obj.item;
			}
			global.ui.rect_obj = undefined
		}
	}
	else
	{
		global.ui.rect_obj = undefined
	}
}