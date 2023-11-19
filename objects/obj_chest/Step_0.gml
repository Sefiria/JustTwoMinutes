if(state == "opening")
{
	for(var i=0; i<array_length(loot); i++)
	{
		if(!variable_instance_exists(global.inventory, loot[i].k))
			global.inventory[$ loot[i].k] = loot[i].v;
		else
			global.inventory[$ loot[i].k] += loot[i].v;
		array_push(todraw, {name:loot[i].k, count:loot[i].v, time:drawtime});
	}
	state = "open";
}