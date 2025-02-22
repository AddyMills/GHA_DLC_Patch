
script create_pause_menu \{Player = 1
		for_options = 0
		for_practice = 0}
	if GotParam \{device_num}
		player_device = <device_num>
	else
		player_device = ($last_start_pressed_device)
	endif
	exclusive_device = <player_device>
	dont_show_options = 0
	if ($player1_device = <player_device>)
		<Player> = 1
	elseif ($player2_device = <player_device>)
		<Player> = 2
	else
		if NOT IsSinglePlayerGame
			if (<player_device> = -1)
				<dont_show_options> = 1
				exclusive_mp_controllers = [0 , 0]
				SetArrayElement ArrayName = exclusive_mp_controllers Index = 0 NewValue = ($player1_device)
				SetArrayElement ArrayName = exclusive_mp_controllers Index = 1 NewValue = ($player2_device)
				<exclusive_device> = <exclusive_mp_controllers>
			endif
		else
			<dont_show_options> = 1
			<exclusive_device> = ($player1_device)
		endif
	endif
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	if (<for_options> = 0)
		if ($view_mode)
			return
		endif
		enable_pause
		safe_create_gh3_pause_menu
	else
		kill_start_key_binding
		flame_handlers = [
			{pad_back ui_flow_manager_respond_to_action Params = {action = go_back}}
		]
	endif
	Change \{bunny_flame_index = 1}
	pause_z = 10000
	Spacing = -55
	if (<for_options> = 0)
		Menu_pos = (740.0, 190.0)
		if (<for_practice> = 1)
			<Menu_pos> = (640.0, 165.0)
			<Spacing> = -55
		endif
	else
		if NOT German
			<Spacing> = -55
		else
			<Spacing> = -35
		endif
		if IsGuitarController controller = <player_device>
			Menu_pos = (640.0, 265.0)
			if German
				<Menu_pos> = (<Menu_pos> + (0.0, -60.0))
			endif
		else
			Menu_pos = (640.0, 300.0)
			if German
				<Menu_pos> = (<Menu_pos> + (0.0, -30.0))
			endif
		endif
	endif
	new_menu {
		scrollid = scrolling_pause
		vmenuid = vmenu_pause
		Menu_pos = <Menu_pos>
		Rot_Angle = 2
		event_handlers = <flame_handlers>
		Spacing = <Spacing>
		use_backdrop = (0)
		exclusive_device = <exclusive_device>
		focus_color = light_brown
		unfocus_color = brown
	}
	create_simple_frame texture = frame_pause_A Z = (<pause_z> - 10) center_offset = (0.0, 0.0)
	if ($is_network_game = 0)
		if NOT ($current_num_players > 1)
			CreateScreenElement {
				Type = SpriteElement
				PARENT = pause_menu_frame_container
				texture = menu_pause_frame_banner
				Pos = (640.0, 570.0)
				just = [Center Center]
				rgba = (($G_menu_colors).lt_violet_grey)
				z_priority = (<pause_z> + 100)
			}
		endif
		if GotParam \{banner_text}
			pause_player_text = <banner_text>
			if GotParam \{banner_scale}
				pause_player_scale = <banner_scale>
			else
				pause_player_scale = (1.0, 1.0)
			endif
		else
			if (<for_options> = 0)
				if (<for_practice> = 1)
					<pause_player_text> = "PAUSED"
				else
					if ((IsSinglePlayerGame) || <dont_show_options> = 1)
						<pause_player_text> = "PAUSED"
					else
						FormatText TextName = pause_player_text "P%d PAUSED" D = <Player>
					endif
				endif
				pause_player_scale = (0.6, 0.75)
			else
				pause_player_text = "OPTIONS"
				pause_player_scale = (0.75, 0.75)
			endif
		endif
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = <Id>
		Text = <pause_player_text>
		font = text_a6
		Pos = (125.0, 53.0)
		Scale = <pause_player_scale>
		rgba = (($G_menu_colors).BLACK)
		Scale = 0.8
	}
	text_scale = (1.0, 1.1)
	if (<for_options> = 0 && <for_practice> = 0)
		CreateScreenElement {
			Type = ContainerElement
			PARENT = pause_menu_frame_container
			Id = bunny_container
			Pos = (380.0, 170.0)
			just = [LEFT Top]
			z_priority = <pause_z>
		}
		I = 1
		begin
		FormatText ChecksumName = bunny_id 'pause_bunny_flame_%d' D = <I>
		FormatText ChecksumName = bunny_tex 'GH3_Pause_Bunny_Flame%d' D = <I>
		CreateScreenElement {
			Type = SpriteElement
			Id = <bunny_id>
			PARENT = bunny_container
			Pos = (160.0, 170.0)
			texture = <bunny_tex>
			rgba = [255 255 255 255]
			Dims = (300.0, 300.0)
			just = [RIGHT Bottom]
			z_priority = (<pause_z> + 3)
			Rot_Angle = 5
		}
		if (<I> > 1)
			DoScreenElementMorph Id = <bunny_id> Alpha = 0
		endif
		<I> = (<I> + 1)
		repeat 7
		CreateScreenElement {
			Type = SpriteElement
			Id = pause_bunny_shadow
			PARENT = bunny_container
			texture = GH3_Pause_Bunny
			rgba = [0 0 0 128]
			Pos = (20.0, -110.0)
			Dims = (500.0, 500.0)
			just = [Center Top]
			z_priority = (<pause_z> + 4)
		}
		CreateScreenElement {
			Type = SpriteElement
			Id = pause_bunny
			PARENT = bunny_container
			texture = GH3_Pause_Bunny
			rgba = [255 255 255 255]
			Pos = (0.0, -130.0)
			Dims = (500.0, 500.0)
			just = [Center Top]
			z_priority = (<pause_z> + 5)
		}
		RunScriptOnScreenElement \{Id = bunny_container
			bunny_hover
			Params = {
				hover_origin = (380.0, 170.0)
			}}
	endif
	container_params = {Type = ContainerElement PARENT = vmenu_pause Dims = (0.0, 100.0)}
	if (<for_options> = 0)
		if (<for_practice> = 1)
			if English
				text_scale = (0.95, 0.95)
				vmenu_pause :SetProps \{Pos = (0.0, 300.0)
					spacing_between = -60}
			else
				text_scale = (0.82, 0.82)
				vmenu_pause :SetProps \{spacing_between = -65}
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = pause_resume}}
					{unfocus retail_menu_unfocus Params = {Id = pause_resume}}
					{pad_choose gh3_start_pressed}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				Id = pause_resume
				Text = "RESUME"
				just = [Center Top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <exclusive_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = pause_restart}}
					{unfocus retail_menu_unfocus Params = {Id = pause_restart}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_restart}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				Text = "RESTART"
				Id = pause_restart
				just = [Center Top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <exclusive_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if (<dont_show_options> = 0)
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{Focus retail_menu_focus Params = {Id = pause_options}}
						{unfocus retail_menu_unfocus Params = {Id = pause_options}}
						{pad_choose ui_flow_manager_respond_to_action Params = {action = select_options create_params = {player_device = <player_device>}}}
					]
				}
				CreateScreenElement {
					Type = TextElement
					PARENT = <Id>
					font = fontgrid_title_gh3
					Scale = <text_scale>
					rgba = ($menu_unfocus_color)
					Text = "OPTIONS"
					Id = pause_options
					just = [Center Top]
					Shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <exclusive_device>
				}
				GetScreenElementDims Id = <Id>
				fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = pause_change_speed}}
					{unfocus retail_menu_unfocus Params = {Id = pause_change_speed}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_change_speed}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				Text = "CHANGE SPEED"
				Id = pause_change_speed
				just = [Center Top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <exclusive_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = pause_change_section}}
					{unfocus retail_menu_unfocus Params = {Id = pause_change_section}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_change_section}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				Text = "CHANGE SECTION"
				Id = pause_change_section
				just = [Center Top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <exclusive_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($came_to_practice_from = main_menu)
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{Focus retail_menu_focus Params = {Id = pause_new_song}}
						{unfocus retail_menu_unfocus Params = {Id = pause_new_song}}
						{pad_choose ui_flow_manager_respond_to_action Params = {action = select_new_song}}
					]
				}
				CreateScreenElement {
					Type = TextElement
					PARENT = <Id>
					font = fontgrid_title_gh3
					Scale = <text_scale>
					rgba = ($menu_unfocus_color)
					Text = "NEW SONG"
					Id = pause_new_song
					just = [Center Top]
					Shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <exclusive_device>
				}
				GetScreenElementDims Id = <Id>
				fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = pause_quit}}
					{unfocus retail_menu_unfocus Params = {Id = pause_quit}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_quit}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				Text = "QUIT"
				Id = pause_quit
				just = [Center Top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <exclusive_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			add_user_control_helper \{Text = "SELECT"
				button = Green
				Z = 100000}
			add_user_control_helper \{Text = "UP/DOWN"
				button = Strumbar
				Z = 100000}
		else
			if English
			else
				container_params = {Type = ContainerElement PARENT = vmenu_pause Dims = (0.0, 105.0)}
				text_scale = (0.8, 0.8)
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = pause_resume}}
					{unfocus retail_menu_unfocus Params = {Id = pause_resume}}
					{pad_choose gh3_start_pressed}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				Text = "RESUME"
				Id = pause_resume
				just = [Center Top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <exclusive_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((250.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($is_network_game = 0)
				if NOT ($end_credits = 1)
					CreateScreenElement {
						<container_params>
						event_handlers = [
							{Focus retail_menu_focus Params = {Id = pause_restart}}
							{unfocus retail_menu_unfocus Params = {Id = pause_restart}}
							{pad_choose ui_flow_manager_respond_to_action Params = {action = select_restart}}
						]
					}
					CreateScreenElement {
						Type = TextElement
						PARENT = <Id>
						font = fontgrid_title_gh3
						Scale = <text_scale>
						rgba = ($menu_unfocus_color)
						Text = "RESTART"
						Id = pause_restart
						just = [Center Top]
						Shadow
						shadow_offs = (3.0, 3.0)
						shadow_rgba [0 0 0 255]
						z_priority = <pause_z>
						exclusive_device = <exclusive_device>
					}
					GetScreenElementDims Id = <Id>
					fit_text_in_rectangle Id = <Id> Dims = ((250.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					if ($is_demo_mode = 1)
						demo_mode_disable = {rgba = [80 80 80 255] NOT_FOCUSABLE}
					else
						demo_mode_disable = {}
					endif
					if (($game_mode = p1_career && $boss_battle = 0) || ($game_mode = p1_quickplay))
						CreateScreenElement {
							<container_params>
							event_handlers = [
								{Focus retail_menu_focus Params = {Id = pause_practice}}
								{unfocus retail_menu_unfocus Params = {Id = pause_practice}}
								{pad_choose ui_flow_manager_respond_to_action Params = {action = select_practice}}
							]
						}
						CreateScreenElement {
							Type = TextElement
							PARENT = <Id>
							font = fontgrid_title_gh3
							Scale = <text_scale>
							rgba = ($menu_unfocus_color)
							Text = "PRACTICE"
							Id = pause_practice
							just = [Center Top]
							Shadow
							shadow_offs = (3.0, 3.0)
							shadow_rgba [0 0 0 255]
							z_priority = <pause_z>
							exclusive_device = <exclusive_device>
							<demo_mode_disable>
						}
						GetScreenElementDims Id = <Id>
						fit_text_in_rectangle Id = <Id> Dims = ((260.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					endif
					if (<dont_show_options> = 0)
						CreateScreenElement {
							<container_params>
							event_handlers = [
								{Focus retail_menu_focus Params = {Id = pause_options}}
								{unfocus retail_menu_unfocus Params = {Id = pause_options}}
								{pad_choose ui_flow_manager_respond_to_action Params = {action = select_options create_params = {player_device = <player_device>}}}
							]
						}
						CreateScreenElement {
							Type = TextElement
							PARENT = <Id>
							font = fontgrid_title_gh3
							Scale = <text_scale>
							rgba = ($menu_unfocus_color)
							Text = "OPTIONS"
							Id = pause_options
							just = [Center Top]
							Shadow
							shadow_offs = (3.0, 3.0)
							shadow_rgba [0 0 0 255]
							z_priority = <pause_z>
							exclusive_device = <exclusive_device>
						}
						GetScreenElementDims Id = <Id>
						fit_text_in_rectangle Id = <Id> Dims = ((260.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					endif
				endif
			endif
			if NOT ($end_credits = 1)
				quit_script = ui_flow_manager_respond_to_action
				quit_script_params = {action = select_quit create_params = {Player = <Player>}}
				if ($is_network_game)
					quit_script = create_leaving_lobby_dialog
					quit_script_params = {
						create_pause_menu
						pad_back_script = return_to_pause_menu_from_net_warning
						pad_choose_script = pause_menu_really_quit_net_game
						Z = 300
					}
				endif
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{Focus retail_menu_focus Params = {Id = pause_quit}}
						{unfocus retail_menu_unfocus Params = {Id = pause_quit}}
						{pad_choose <quit_script> Params = <quit_script_params>}
					]
				}
				CreateScreenElement {
					Type = TextElement
					PARENT = <Id>
					font = fontgrid_title_gh3
					Scale = <text_scale>
					rgba = ($menu_unfocus_color)
					Text = "QUIT"
					Id = pause_quit
					just = [Center Top]
					Shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <exclusive_device>
				}
				GetScreenElementDims Id = <Id>
				fit_text_in_rectangle Id = <Id> Dims = ((270.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			if ($enable_button_cheats = 1)
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{Focus retail_menu_focus Params = {Id = pause_debug_menu}}
						{unfocus retail_menu_unfocus Params = {Id = pause_debug_menu}}
						{pad_choose ui_flow_manager_respond_to_action Params = {action = select_debug_menu}}
					]
				}
				CreateScreenElement {
					Type = TextElement
					PARENT = <Id>
					font = fontgrid_title_gh3
					Scale = <text_scale>
					rgba = [136 95 50 100]
					Text = "DEBUG"
					Id = pause_debug_menu
					just = [Center Top]
					z_priority = <pause_z>
					exclusive_device = <exclusive_device>
				}
			endif
			add_user_control_helper \{Text = "SELECT"
				button = Green
				Z = 100000}
			add_user_control_helper \{Text = "UP/DOWN"
				button = Strumbar
				Z = 100000}
		endif
	else
		<fit_dims> = (400.0, 0.0)
		CreateScreenElement {
			Type = ContainerElement
			PARENT = vmenu_pause
			Dims = (0.0, 100.0)
			Pos = (0.0, 20.0)
			event_handlers = [
				{Focus retail_menu_focus Params = {Id = options_audio}}
				{unfocus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus Params = {Id = options_audio}}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_audio_settings create_params = {Player = <Player>}}}
			]
		}
		CreateScreenElement {
			Type = TextElement
			PARENT = <Id>
			font = fontgrid_title_gh3
			Scale = <text_scale>
			rgba = ($menu_unfocus_color)
			Text = "SET AUDIO"
			Id = options_audio
			just = [Center Center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <exclusive_device>
		}
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		CreateScreenElement {
			Type = ContainerElement
			PARENT = vmenu_pause
			Dims = (0.0, 100.0)
			event_handlers = [
				{Focus retail_menu_focus Params = {Id = options_calibrate_lag}}
				{unfocus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus Params = {Id = options_calibrate_lag}}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_calibrate_lag create_params = {Player = <Player>}}}
			]
		}
		CreateScreenElement {
			Type = TextElement
			PARENT = <Id>
			font = fontgrid_title_gh3
			Scale = <text_scale>
			rgba = ($menu_unfocus_color)
			Text = "CALIBRATE LAG"
			Id = options_calibrate_lag
			just = [Center Center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <exclusive_device>
		}
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		if IsGuitarController controller = <player_device>
			CreateScreenElement {
				Type = ContainerElement
				PARENT = vmenu_pause
				Dims = (0.0, 100.0)
				event_handlers = [
					{Focus retail_menu_focus Params = {Id = options_calibrate_whammy}}
					{unfocus generic_menu_up_or_down_sound}
					{unfocus retail_menu_unfocus Params = {Id = options_calibrate_whammy}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_calibrate_whammy_bar create_params = {Player = <Player> Popup = 1}}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				Text = "CALIBRATE WHAMMY"
				Id = options_calibrate_whammy
				just = [Center Center]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <exclusive_device>
			}
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		endif
		if IsSinglePlayerGame
			lefty_flip_text = "LEFTY FLIP:"
		else
			if (<Player> = 1)
				lefty_flip_text = "P1 LEFTY FLIP:"
			else
				lefty_flip_text = "P2 LEFTY FLIP:"
			endif
		endif
		CreateScreenElement {
			Type = ContainerElement
			PARENT = vmenu_pause
			Dims = (0.0, 100.0)
			event_handlers = [
				{Focus retail_menu_focus Params = {Id = pause_options_lefty}}
				{unfocus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus Params = {Id = pause_options_lefty}}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_lefty_flip create_params = {Player = <Player>}}}
			]
		}
		<lefty_container> = <Id>
		CreateScreenElement {
			Type = TextElement
			PARENT = <lefty_container>
			Id = pause_options_lefty
			font = fontgrid_title_gh3
			Scale = <text_scale>
			rgba = ($menu_unfocus_color)
			Text = <lefty_flip_text>
			just = [Center Center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <exclusive_device>
		}
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		GetGlobalTags \{user_options}
		if (<Player> = 1)
			if (<lefty_flip_p1> = 1)
				lefty_tex = Options_Controller_Check
			else
				lefty_tex = Options_Controller_X
			endif
		else
			if (<lefty_flip_p2> = 1)
				lefty_tex = Options_Controller_Check
			else
				lefty_tex = Options_Controller_X
			endif
		endif
		displaySprite {
			PARENT = <lefty_container>
			tex = <lefty_tex>
			just = [Center Center]
			Z = (<pause_z> + 10)
		}
		GetScreenElementDims \{Id = pause_options_lefty}
		<Id> :SetProps Pos = (<width> * (0.5, 0.0) + (22.0, 0.0))
		add_user_control_helper \{Text = "SELECT"
			button = Green
			Z = 100000}
		add_user_control_helper \{Text = "BACK"
			button = RED
			Z = 100000}
		add_user_control_helper \{Text = "UP/DOWN"
			button = Strumbar
			Z = 100000}
	endif
	if ($is_network_game = 0)
		if NOT IsSinglePlayerGame
			if (<for_practice> = 0 && <dont_show_options> = 0)
				FormatText TextName = player_paused_text "PLAYER %d PAUSED. ONLY PLAYER %d OPTIONS ARE AVAILABLE." D = <Player>
				CreateScreenElement {
					Type = SpriteElement
					PARENT = pause_menu_frame_container
					Id = pause_helper_text_bg
					texture = Control_pill_body
					Pos = (640.0, 606.0)
					just = [Center Center]
					rgba = [90 85 100 255]
					z_priority = (<pause_z> - 8)
				}
				CreateScreenElement {
					Type = TextElement
					PARENT = pause_menu_frame_container
					Pos = (640.0, 609.0)
					just = [Center Center]
					Text = <player_paused_text>
					rgba = [170 120 100 255]
					Scale = (0.45000002, 0.6)
					z_priority = (<pause_z> - 0)
					font = text_a6
					Shadow
					shadow_offs = (1.0, 1.0)
				}
				GetScreenElementDims Id = <Id>
				bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
				pause_helper_text_bg :SetProps Dims = <bg_dims>
				CreateScreenElement {
					Type = SpriteElement
					PARENT = pause_menu_frame_container
					texture = Control_pill_end
					Pos = ((640.0, 606.0) - <width> * (0.5, 0.0))
					rgba = [90 85 100 255]
					just = [RIGHT Center]
					flip_v
					z_priority = (<pause_z> - 8)
				}
				CreateScreenElement {
					Type = SpriteElement
					PARENT = pause_menu_frame_container
					texture = Control_pill_end
					Pos = ((640.0, 606.0) + <width> * (0.5, 0.0))
					rgba = [90 85 100 255]
					just = [LEFT Center]
					z_priority = (<pause_z> - 8)
				}
			endif
		endif
	endif
	Change \{menu_choose_practice_destroy_previous_menu = 1}
	if (<for_options> = 0 && <for_practice> = 0)
		SpawnScriptNow \{animate_bunny_flame}
	endif
	UnPauseSpawnedScript \{sysnotify_handle_signin_change}
endscript

script animate_bunny_flame 
	begin
	swap_bunny_flame
	Wait \{0.1
		Second}
	repeat
endscript

script bunny_hover 
	if NOT ScreenElementExists \{Id = bunny_container}
		return
	endif
	I = 1
	begin
	FormatText ChecksumName = bunnyid 'pause_bunny_flame_%d' D = <I>
	if NOT ScreenElementExists Id = <bunnyid>
		return
	else
		SetScreenElementProps Id = <bunnyid> Pos = <flame_origin>
	endif
	<I> = (<I> + 1)
	repeat 7
	begin
	bunny_container :DoMorph \{Pos = (360.0, 130.0)
		Time = 1
		Rot_Angle = -25
		Scale = 1.05
		Motion = ease_out}
	bunny_container :DoMorph \{Pos = (390.0, 170.0)
		Time = 1
		Rot_Angle = -20
		Scale = 0.95
		Motion = ease_in}
	bunny_container :DoMorph \{Pos = (360.0, 130.0)
		Time = 1
		Rot_Angle = -15
		Scale = 1.05
		Motion = ease_out}
	bunny_container :DoMorph \{Pos = (390.0, 170.0)
		Time = 1
		Rot_Angle = -20
		Scale = 0.95
		Motion = ease_in}
	repeat
endscript

script destroy_pause_menu 
	restore_start_key_binding
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu \{menu_id = scrolling_pause}
	destroy_menu \{menu_id = pause_menu_frame_container}
	KillSpawnedScript \{Name = animate_bunny_flame}
	destroy_popup_warning_menu
endscript

script swap_bunny_flame 
	if GotParam \{UP}
		generic_menu_up_or_down_sound \{UP}
		Change \{g_anim_flame = -1}
	elseif GotParam \{DOWN}
		generic_menu_up_or_down_sound \{DOWN}
		Change \{g_anim_flame = 1}
	endif
	Change bunny_flame_index = ($bunny_flame_index + $g_anim_flame)
	if ($bunny_flame_index > 7)
		Change \{bunny_flame_index = 1}
	endif
	if ($bunny_flame_index < 1)
		Change \{bunny_flame_index = 7}
	endif
	reset_bunny_alpha
	FormatText \{ChecksumName = bunnyid
		'pause_bunny_flame_%d'
		D = $bunny_flame_index}
	if ScreenElementExists Id = <bunnyid>
		DoScreenElementMorph Id = <bunnyid> Alpha = 1
	endif
endscript

script reset_bunny_alpha 
	I = 1
	begin
	FormatText ChecksumName = bunnyid 'pause_bunny_flame_%d' D = <I>
	if ScreenElementExists Id = <bunnyid>
		DoScreenElementMorph Id = <bunnyid> Alpha = 0
	endif
	<I> = (<I> + 1)
	repeat 7
endscript

script create_pause_menu_frame \{tile_sprite = 1
		container_id = pause_menu_frame_container
		Z = 0
		gradient = 1
		PARENT = root_window
		Scale = 1.2}
	create_simple_frame {
		texture = frame_pause_A
		Z = <Z>
		center_offset = (0.0, 0.0)
		container_id = <container_id>
		gradient = <gradient>
		PARENT = <PARENT>
		Scale = <Scale>
	}
endscript

script create_simple_frame \{center_offset = (0.0, 0.0)
		Scale = 1.2
		Z = 0
		texture = frame_pause_A
		container_id = pause_menu_frame_container
		PARENT = root_window
		gradient = 1}
	center_pos = ((640.0, 360.0) + <center_offset>)
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <PARENT>
		Id = <container_id>
		Pos = ((0.0, 0.0) + <center_offset>)
		just = [LEFT Top]
		z_priority = <Z>
	}
	if (<gradient> = 1)
		CreateScreenElement {
			Type = SpriteElement
			Id = pause_gradient
			PARENT = <container_id>
			texture = gradient_128
			Pos = (0.0, 0.0)
			rgba = [0 0 0 180]
			Dims = (1280.0, 720.0)
			just = [LEFT Top]
			z_priority = (<Z> + 1)
		}
	endif
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		texture = <texture>
		Id = graphic_test
		just = [Center Center]
		Pos = <center_pos>
		Scale = <Scale>
		z_priority = (<Z> + 2)
	}
endscript

script destroy_pause_menu_frame \{container_id = pause_menu_frame_container}
	destroy_menu menu_id = <container_id>
endscript
