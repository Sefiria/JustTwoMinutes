if(end_path == false)
{
	x += look.x * mvspeed;
	y += look.y * mvspeed;
}
else
{
	time--;
	if(time <= 0)
		instance_destroy();
}