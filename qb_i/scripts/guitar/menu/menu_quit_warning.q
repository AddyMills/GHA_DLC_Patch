
script create_quit_warning_menu \{player = 1
		option1_text = "ANNULLA"
		option2_text = "ESCI"}
	disable_pause
	player_device = ($last_start_pressed_device)
	create_popup_warning_menu {
		textblock = {
			text = "Se abbandoni, tutti i progressi non salvati andranno persi. Vuoi continuare?"
			dims = (600.0, 400.0)
			scale = 0.6
		}
		player_device = <player_device>
		no_background
		menu_pos = (640.0, 480.0)
		dialog_dims = (600.0, 80.0)
		helper_pills = [select updown]
		options = [
			{
				func = menu_flow_go_back
				text = <option1_text>
			}
			{
				func = quit_warning_select_quit
				text = <option2_text>
			}
		]
	}
endscript

script destroy_quit_warning_menu 
	destroy_popup_warning_menu
endscript

script quit_warning_select_quit \{player = 1}
	resetscoreupdateready
	gh3_sfx_fail_song_stop_sounds
	ui_flow_manager_respond_to_action action = continue create_params = {player = <player>}
endscript
