function Slot(_name, _index, _type = 0) constructor
{
	var _ofs, _ofx, _ofy;
	
	name = _name;
	index = _index;
	w = sprite_get_width(spr_ui_slot);
	h = sprite_get_height(spr_ui_slot);
	content = undefined;// should be an Item
	switch _type
	{
		case 0:
			_ofs = 20;
			_ofx = window_get_width() / 2;
			_ofy = window_get_height() - 40 - h;
			x = _ofx - (3 * (w+_ofs)) / 2 + index * (w+_ofs);
			y = _ofy;
		break;
		
		case 1:
			_ofs = 10;
			_ofx = window_get_width() / 2;
			_ofy = window_get_height() / 2;
			x = _ofx - 2 * (w + _ofs) + index.i * (w+_ofs);
			y = _ofy - 2 * (h + _ofs) + index.j * (h+_ofs);
		break;
	}
	
	function is_mouse_over()
	{
		return point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x-w/2, y-h/2, x+w/2, y+h/2);
	}
}

function SlotContainer(_slots) constructor
{
	objects= _slots;
	function length() { return array_length(objects); }
	function get_by_name(_name)
	{
		return array_find_index(objects, function(_element, _index){return _element.name == _name});
	}
	function get_over()
	{
		return array_find_index(objects, function(_element, _index){return _element.is_mouse_over() == true});
	}
	function no_over() { return get_over() == -1;}
	function any_over() { return !no_over(); }

	function slot_get_available_i_j()
	{
		for(var j=0;j<4;j++)
			for(var i=0;i<4;i++)
				if(objects[i+j*4].content == undefined)
					return {i:i,j:j};
		return undefined;
	}
	function slot_any_available() { return slot_get_available_i_j() != undefined; }
	function slot_no_available() { return !slot_any_available; }
	function slot_get(_index_i_j) { return objects[_index_i_j]; }
	function slot_set_content(_content) { return objects[_index_i_j].content = _content; }// _content should be keypairvalue {k:"",v:10}
}
