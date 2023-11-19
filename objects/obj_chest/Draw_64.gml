for(var i=0; i<array_length(todraw); i++)
{
	draw_text(10, 10 + 32 * i, todraw[i].name + ": " + string(todraw[i].count));
	todraw[i].time--;
	if(todraw[i].time <=0)
		array_delete(todraw, i--, 1);
}