if(state == "opening")
{
	for(var i=0; i<array_length(loot); i++)
	{
		var _item = loot[i];
		inv_add(loot[i]);
		array_push(todraw, {item:{name:_item.name,count:_item.count,type:_item.type}, time:drawtime});
	}
	state = "open";
}