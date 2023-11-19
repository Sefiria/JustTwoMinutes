// Stop the menu music
audio_stop_sound(snd_music_menu);

// Stop the game music
audio_stop_sound(snd_music_game);

if(!struct_exists(global, "inventory"))
{
	global.inventory = ds_map_create();
	global.inventory[$ "coins"] = 0;
}
else
{
	if(!ds_map_exists(global.inventory, "coins"))
		global.inventory[$ "coins"] = 0;
}

draw_ui_init();

global.hold_control = 0;