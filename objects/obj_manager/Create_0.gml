// Stop the menu music
audio_stop_sound(snd_music_menu);

// Stop the game music
audio_stop_sound(snd_music_game);

create_inv();

draw_ui_init();

global.hold_control = 0;