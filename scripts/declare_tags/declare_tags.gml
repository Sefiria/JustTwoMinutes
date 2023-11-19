enum ITEM_TYPES
{
	WEAPON,
	ARMOR,
	POTION,
	MUNITION,
	OTHER
}

// _type is ITEM_TYPES, _name is string, _count is real
function Item(_type, _name, _count) constructor
{
	type = _type;
	name = _name;
	count = _count;
}