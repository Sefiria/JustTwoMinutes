function sprbank_get(name)
{
	switch(name)
	{
		case "bow": return spr_bow;
		case "arrow": return spr_arrow;
		case "coin": return spr_coin;
		default: return spr_unknown;
	}
}