g_hub_destroy = 0
g_hub_created = 0
g_hub_helpers_created = 0
g_hub_characters_dirty = 1

script set_character_hub_dirty 
	Change \{g_hub_characters_dirty = 1}
endscript

script do_character_hub_dirty 
	<Player> = 1
	begin
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	if find_profile_by_id Id = ($<player_status>.character_id)
		get_musician_profile_struct Index = <Index>
		FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player> AddToStringLookup = TRUE
		if GetGlobalTags <characterguitartags> noassert = 1
			Printf <current_instrument>
			Printf \{$game_mode}
			if (<current_instrument> = GUITAR)
				<inst_id> = <current_selected_guitar>
			else
				SetGlobalTags <characterguitartags> Params = {current_instrument = GUITAR}
				<inst_id> = <current_selected_guitar>
			endif
			Change StructureName = <player_status> instrument_id = <inst_id>
			Change StructureName = <player_status> outfit = <current_outfit>
			Change StructureName = <player_status> style = <current_style>
		endif
	endif
	<Player> = 2
	repeat 2
	create_guitarist \{Name = GUITARIST
		UseOldPos
		no_strum
		animpak = 0}
	create_guitarist \{Name = BASSIST
		UseOldPos
		no_strum
		animpak = 0}
	if ($current_num_players = 1)
		if CompositeObjectExists \{Name = BASSIST}
			BASSIST :Hide
		endif
	endif
	if (($is_network_game = 1) && ($player2_present = 0))
		if CompositeObjectExists Name = ($player2_status.band_Member)
			($player2_status.band_Member) :Hide
		endif
	endif
	Change \{g_hub_characters_dirty = 0}
endscript

script create_character_hub_menu \{Player = 1}
	UnPauseSpawnedScript \{sysnotify_handle_signin_change}
	if ($g_hub_characters_dirty)
		do_character_hub_dirty
	endif
	Change \{menu_flow_locked = 1}
	if (<Player> = 1)
		Change \{p1_ready = 0}
	else
		Change \{p2_ready = 0}
	endif
	exclusive_dev = $player1_device
	if (<Player> = 2)
		if (($is_network_game) = 0)
			<exclusive_dev> = $player2_device
		else
			<exclusive_dev> = $primary_controller
		endif
	else
		if (($is_network_game) = 1)
			<exclusive_dev> = $primary_controller
		endif
		if ($num_user_control_helpers = 0)
			add_user_control_helper \{Text = "SELECT"
				button = Green
				Z = 100}
			add_user_control_helper \{Text = "BACK"
				button = RED
				Z = 100}
			add_user_control_helper \{Text = "UP/DOWN"
				button = Strumbar
				Z = 100}
			Change \{g_hub_helpers_created = 1}
		endif
	endif
	event_handlers = [
		{pad_up character_hub_generic_sound Params = {Player = <Player> UP}}
		{pad_down character_hub_generic_sound Params = {Player = <Player> DOWN}}
		{pad_back character_hub_go_back Params = {Player = <Player>}}
		{pad_start menu_show_gamercard}
	]
	if ($is_network_game)
		event_handlers = [
			{pad_up character_hub_generic_sound Params = {Player = <Player> UP}}
			{pad_down character_hub_generic_sound Params = {Player = <Player> DOWN}}
			{pad_back net_request_play_show Params = {action = 0}}
			{pad_start menu_show_gamercard}
		]
		net_info_panel_show
	endif
	show_change_outfit = 1
	if (<Player> = 1)
		find_profile_by_id Id = ($player1_status.character_id)
	else
		find_profile_by_id Id = ($player2_status.character_id)
	endif
	get_musician_profile_struct Index = <Index>
	if NOT StructureContains Structure = (<profile_struct>) outfits
		<show_change_outfit> = 0
	endif
	<menu_pos_tweak> = (0.0, 0.0)
	<co_tweak> = (0.0, 0.0)
	if (<Player> = 1)
		if (($is_network_game) = 1)
			menu_pos_tweak = (-65.0, 0.0)
		endif
		if ($current_num_players = 2)
			if NOT (<show_change_outfit>)
				<co_tweak> = (0.0, 40.0)
			endif
			<Menu_pos> = (360.0, 444.0)
			if ($game_mode = p2_quickplay || $game_mode = p2_coop)
				<Menu_pos> = (<Menu_pos> + (0.0, -40.0))
			endif
			new_menu {
				scrollid = scrolling_character_hub_p1
				vmenuid = vmenu_character_hub_p1
				use_backdrop = 0
				Menu_pos = (<Menu_pos> + <menu_pos_tweak> + <co_tweak>)
				exclusive_device = <exclusive_dev>
				event_handlers = <event_handlers>
				no_focus = 1
			}
		else
			<Menu_pos> = (294.0, 172.0)
			new_menu {
				scrollid = scrolling_character_hub_p1
				vmenuid = vmenu_character_hub_p1
				use_backdrop = 0
				Menu_pos = <Menu_pos>
				event_handlers = <event_handlers>
				no_focus = 1
			}
		endif
		vparent = vmenu_character_hub_p1
		continue_id = character_hub_p1_continue
		ch_change_char_id = ch_change_char_id_p1
		ch_change_outfit_id = ch_change_outfit_id_p1
		ch_change_guitar_id = ch_change_guitar_id_p1
		ch_change_bass_id = ch_change_bass_id_p1
		CreateScreenElement {
			Type = ContainerElement
			PARENT = root_window
			Id = character_hub_p1_container
			just = [LEFT Top]
			Pos = ((0.0, 0.0) + <menu_pos_tweak>)
		}
		create_ready_icons \{pos1 = (400.0, 500.0)
			parent1 = character_hub_p1_container}
		if ($is_network_game)
			if NOT (ScreenElementExists Id = ready_container_p2)
				create_ready_icons \{pos2 = (825.0, 450.0)
					parent2 = root_window}
			endif
		endif
	else
		<Menu_pos> = (710.0, 444.0)
		if ($game_mode = p2_quickplay || $game_mode = p2_coop)
			<Menu_pos> = (<Menu_pos> + (0.0, -40.0))
		endif
		if (($is_network_game) = 1)
			menu_pos_tweak = (75.0, 0.0)
		endif
		if NOT (<show_change_outfit>)
			<co_tweak> = (0.0, 40.0)
		endif
		new_menu {
			scrollid = scrolling_character_hub_p2
			vmenuid = vmenu_character_hub_p2
			use_backdrop = 0
			Menu_pos = (<Menu_pos> + <menu_pos_tweak> + <co_tweak>)
			exclusive_device = <exclusive_dev>
			event_handlers = <event_handlers>
			no_focus = 1
		}
		vparent = vmenu_character_hub_p2
		continue_id = character_hub_p2_continue
		ch_change_char_id = ch_change_char_id_p2
		ch_change_outfit_id = ch_change_outfit_id_p2
		ch_change_guitar_id = ch_change_guitar_id_p2
		ch_change_bass_id = ch_change_bass_id_p2
		if (($is_network_game) = 1)
			LaunchEvent \{Type = unfocus
				Target = vmenu_character_hub_p2}
		endif
		CreateScreenElement {
			Type = ContainerElement
			PARENT = root_window
			Id = character_hub_p2_container
			just = [LEFT Top]
			Pos = ((0.0, 0.0) + <menu_pos_tweak>)
		}
		create_ready_icons \{pos2 = (746.0, 500.0)
			parent2 = character_hub_p2_container}
	endif
	setup_character_hub Player = <Player>
	FormatText ChecksumName = player_container 'character_hub_p%p_container' P = <Player>
	if NOT ScreenElementExists Id = <player_container>
		return
	endif
	if ($current_num_players = 2)
		if (<Player> = 1)
			myparent = character_hub_p1_container
			<highlight_color> = (($G_menu_colors).light_brown)
		else
			myparent = character_hub_p2_container
			<highlight_color> = (($G_menu_colors).lt_violet_bar)
		endif
		<ch_focus_color> = (($G_menu_colors).BLACK)
		<ch_unfocus_color> = (($G_menu_colors).dk_violet_grey)
		displaySprite {
			PARENT = <myparent>
			tex = character_hub_hilite_bookend
			Dims = (30.0, 40.0)
			just = [LEFT Top]
			rgba = <highlight_color>
			Z = 4
			flip_v
		}
		<bookEnd1ID> = <Id>
		displaySprite {
			PARENT = <myparent>
			tex = character_hub_hilite_bookend
			Dims = (30.0, 40.0)
			just = [RIGHT Top]
			rgba = <highlight_color>
			Z = 4
		}
		<bookEnd2ID> = <Id>
		displaySprite {
			PARENT = <myparent>
			tex = hilite_bar_01
			just = [LEFT Top]
			rgba = <highlight_color>
			Dims = (264.0, 40.0)
			Pos = (226.0, 136.0)
			Z = 2
		}
		<whiteTexHighlightID> = <Id>
		<window_frame_color> = (($G_menu_colors).frame_rgba)
		<window_fill_color> = (($G_menu_colors).fill_rgba)
		if (<Player> = 1)
			<hub_menu_center_pos> = (460.0, 526.0)
		else
			<hub_menu_center_pos> = (810.0, 526.0)
		endif
		<frame_dims> = (280.0, 320.0)
		if ($game_mode = p2_quickplay || $game_mode = p2_coop)
			<hub_menu_center_pos> = (<hub_menu_center_pos> - (0.0, 20.0))
			<frame_dims> = (<frame_dims> + (0.0, 40.0))
			center_pos = <hub_menu_center_pos>
		endif
		if (<show_change_outfit>)
			center_pos = <hub_menu_center_pos>
		else
			<frame_dims> = (<frame_dims> - (0.0, 40.0))
			<hub_menu_center_pos> = (<hub_menu_center_pos> + (0.0, 20.0))
			center_pos = <hub_menu_center_pos>
		endif
		create_UI_frame {
			PARENT = <myparent>
			frame_dims = <frame_dims>
			center_pos = <center_pos>
			frame_rgba = (($G_menu_colors).frame_rgba)
			fill_rgba = (($G_menu_colors).fill_rgba)
			z_priority = 0
			suffix = <Player>
		}
		<header_y_pos> = (<frame_dims>.(0.0, 1.0) * (3.0 / 8.0))
		displaySprite {
			PARENT = <myparent>
			tex = window_header_01
			Pos = (<hub_menu_center_pos> + (<header_y_pos> * (0.0, -1.0)))
			Dims = (256.0, 64.0)
			just = [Center Center]
			rgba = <highlight_color>
			Z = 1
		}
		<ch_menuItemSelected> = 0
		CreateScreenElement {
			Type = TextElement
			PARENT = <vparent>
			Id = <continue_id>
			font = fontgrid_title_gh3
			Scale = (0.8, 0.75)
			rgba = (($G_menu_colors).dk_violet_grey)
			Text = "PLAY SHOW"
			just = [Center Top]
			event_handlers = [
				{Focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						chh_mp = 1
						chh_player = <Player>
						comi = <show_change_outfit>
					}
				}
				{Focus SetScreenElementProps Params = {Id = <continue_id> rgba = <ch_focus_color>}}
				{unfocus SetScreenElementProps Params = {Id = <continue_id> rgba = <ch_unfocus_color>}}
				{pad_choose character_hub_select_play_show Params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		if (($is_network_game) = 1)
			net_event_handlers = [
				{Focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						chh_mp = 1
						chh_player = <Player>
						comi = <show_change_outfit>
					}
				}
				{Focus SetScreenElementProps Params = {Id = <continue_id> rgba = <ch_focus_color>}}
				{unfocus SetScreenElementProps Params = {Id = <continue_id> rgba = <ch_unfocus_color>}}
				{pad_choose net_request_play_show Params = {action = 1}}
				{pad_start menu_show_gamercard}
			]
			<continue_id> :SetProps Text = "READY" rgba = [128 128 128 75] event_handlers = <net_event_handlers> Replace_Handlers block_events
			if (($player2_present) = 1)
				<continue_id> :SetProps rgba = <ch_unfocus_color> unblock_events
			endif
		endif
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		CreateScreenElement {
			Type = TextElement
			PARENT = <vparent>
			Id = <ch_change_char_id>
			font = fontgrid_title_gh3
			Scale = (0.8, 0.75)
			rgba = (($G_menu_colors).dk_violet_grey)
			Text = "CHANGE CHARACTER"
			just = [Center Top]
			event_handlers = [
				{Focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <show_change_outfit>
						chh_mp = 1
						chh_player = <Player>
					}
				}
				{Focus SetScreenElementProps Params = {Id = <ch_change_char_id> rgba = <ch_focus_color>}}
				{unfocus SetScreenElementProps Params = {Id = <ch_change_char_id> rgba = <ch_unfocus_color>}}
				{pad_choose character_hub_go_back Params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		if (<show_change_outfit>)
			CreateScreenElement {
				Type = TextElement
				PARENT = <vparent>
				Id = <ch_change_outfit_id>
				font = fontgrid_title_gh3
				Scale = (0.8, 0.75)
				rgba = (($G_menu_colors).dk_violet_grey)
				Text = "CHANGE OUTFIT"
				just = [Center Top]
				event_handlers = [
					{Focus character_hub_highlighter Params = {
							menuItemNum = <ch_menuItemSelected>
							be1ID = <bookEnd1ID>
							be2ID = <bookEnd2ID>
							wthlID = <whiteTexHighlightID>
							comi = <show_change_outfit>
							chh_mp = 1
							chh_player = <Player>
						}
					}
					{Focus SetScreenElementProps Params = {Id = <ch_change_outfit_id> rgba = <ch_focus_color>}}
					{unfocus SetScreenElementProps Params = {Id = <ch_change_outfit_id> rgba = <ch_unfocus_color>}}
					{pad_choose character_hub_select_change_outfit Params = {Player = <Player>}}
					{pad_start menu_show_gamercard}
				]
				exclusive_device = <exclusive_dev>
			}
			<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		endif
		CreateScreenElement {
			Type = TextElement
			PARENT = <vparent>
			Id = <ch_change_guitar_id>
			font = fontgrid_title_gh3
			Scale = (0.8, 0.75)
			rgba = (($G_menu_colors).dk_violet_grey)
			Text = "CHANGE GUITAR"
			just = [Center Top]
			event_handlers = [
				{Focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <show_change_outfit>
						chh_mp = 1
						chh_player = <Player>
					}
				}
				{Focus SetScreenElementProps Params = {Id = <ch_change_guitar_id> rgba = <ch_focus_color>}}
				{unfocus SetScreenElementProps Params = {Id = <ch_change_guitar_id> rgba = <ch_unfocus_color>}}
				{pad_choose character_hub_select_change_guitar Params = {Player = <Player> vparent = <vparent>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		if ($game_mode = p2_quickplay || $game_mode = p2_coop)
			CreateScreenElement {
				Type = TextElement
				PARENT = <vparent>
				Id = <ch_change_bass_id>
				font = fontgrid_title_gh3
				Scale = (0.8, 0.75)
				rgba = (($G_menu_colors).dk_violet_grey)
				Text = "CHANGE BASS"
				just = [Center Top]
				event_handlers = [
					{Focus character_hub_highlighter Params = {
							menuItemNum = <ch_menuItemSelected>
							be1ID = <bookEnd1ID>
							be2ID = <bookEnd2ID>
							wthlID = <whiteTexHighlightID>
							comi = <show_change_outfit>
							chh_mp = 1
							chh_player = <Player>
						}
					}
					{Focus SetScreenElementProps Params = {Id = <ch_change_bass_id> rgba = <ch_focus_color>}}
					{unfocus SetScreenElementProps Params = {Id = <ch_change_bass_id> rgba = <ch_unfocus_color>}}
					{pad_choose character_hub_select_change_guitar Params = {Player = <Player> BASS vparent = <vparent>}}
					{pad_start menu_show_gamercard}
				]
				exclusive_device = <exclusive_dev>
			}
			<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		endif
	else
		set_focus_color \{Color = BLACK}
		set_unfocus_color \{Color = dk_violet_grey}
		frame_dims = (280.0, 600.0)
		center_pos = (392.0, 341.0)
		create_UI_frame {
			PARENT = character_hub_p1_container
			frame_dims = <frame_dims>
			center_pos = <center_pos>
			frame_rgba = (($G_menu_colors).frame_rgba)
			fill_rgba = (($G_menu_colors).fill_rgba)
			z_priority = 0
		}
		header_pos = (<center_pos> - ((<frame_dims>.(0.0, 1.0)) * (0.0, 0.5) - (0.0, 80.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = character_hub_p1_container
			Pos = <header_pos>
			Id = hub_frame_header_01
			just = [Center Bottom]
			texture = window_header_01
			rgba = (($G_menu_colors).lt_violet_grey)
			z_priority = 1
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = character_hub_p1_container
			Pos = (<center_pos> + (0.0, 175.0))
			Dims = (242.0, 128.0)
			just = [Center Top]
			texture = store_frame_bottom_bg
			z_priority = 4
			rgba = (($G_menu_colors).lt_violet_grey)
		}
		displaySprite {
			PARENT = character_hub_p1_container
			tex = character_hub_hilite_bookend
			Pos = (264.0, 175.0)
			Dims = (30.0, 40.0)
			just = [LEFT Top]
			rgba = (($G_menu_colors).md_violet_grey)
			Z = 4
			flip_v
		}
		<bookEnd1ID> = <Id>
		displaySprite {
			PARENT = character_hub_p1_container
			tex = character_hub_hilite_bookend
			Pos = (532.0, 175.0)
			Dims = (30.0, 40.0)
			just = [RIGHT Top]
			rgba = (($G_menu_colors).md_violet_grey)
			Z = 4
		}
		<bookEnd2ID> = <Id>
		displaySprite {
			PARENT = character_hub_p1_container
			tex = hilite_bar_01
			rgba = (($G_menu_colors).md_violet_grey)
			Pos = (283.0, 160.0)
			Dims = (264.0, 40.0)
			just = [LEFT Top]
			Z = 2
		}
		<whiteTexHighlightID> = <Id>
		get_current_band_info
		GetGlobalTags <band_info>
		FormatText TextName = user_cash_amount "$%d" D = (<Cash>) UseCommas
		CreateScreenElement {
			Type = TextElement
			PARENT = character_hub_p1_container
			Pos = (390.0, 567.0)
			font = text_a4
			Text = <user_cash_amount>
			rgba = (($G_menu_colors).lt_violet_grey)
			z_priority = 5
			just = [Center Center]
			Shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = (($G_menu_colors).BLACK)
		}
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((190.0, 0.0) + (<Height> * (0.0, 1.0))) only_if_larger_x = 1
		<ch_menuItemSelected> = 0
		CreateScreenElement {
			Type = TextElement
			PARENT = <vparent>
			font = fontgrid_title_gh3
			Scale = (0.8, 0.75)
			rgba = ($menu_unfocus_color)
			Text = "PLAY SHOW"
			just = [Center Top]
			event_handlers = [
				{Focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <show_change_outfit>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_select_play_show Params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		CreateScreenElement {
			Type = TextElement
			PARENT = <vparent>
			font = fontgrid_title_gh3
			Scale = (0.8, 0.75)
			rgba = ($menu_unfocus_color)
			Text = "CHANGE CHARACTER"
			just = [Center Top]
			event_handlers = [
				{Focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <show_change_outfit>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_go_back Params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		if (<show_change_outfit>)
			CreateScreenElement {
				Type = TextElement
				PARENT = <vparent>
				font = fontgrid_title_gh3
				Scale = (0.8, 0.75)
				rgba = ($menu_unfocus_color)
				Text = "CHANGE OUTFIT"
				just = [Center Top]
				event_handlers = [
					{Focus character_hub_highlighter Params = {
							menuItemNum = <ch_menuItemSelected>
							be1ID = <bookEnd1ID>
							be2ID = <bookEnd2ID>
							wthlID = <whiteTexHighlightID>
							comi = <show_change_outfit>
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose character_hub_select_change_outfit Params = {Player = <Player>}}
					{pad_start menu_show_gamercard}
				]
			}
			<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
			GetScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		endif
		CreateScreenElement {
			Type = TextElement
			PARENT = <vparent>
			font = fontgrid_title_gh3
			Scale = (0.8, 0.75)
			rgba = ($menu_unfocus_color)
			Text = "CHANGE GUITAR"
			just = [Center Top]
			event_handlers = [
				{Focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <show_change_outfit>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_select_change_guitar Params = {Player = <Player> vparent = <vparent>}}
				{pad_start menu_show_gamercard}
			]
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		if ($is_demo_mode = 1)
			demo_mode_disable = {rgba = [80 80 80 255] NOT_FOCUSABLE}
		else
			demo_mode_disable = {}
		endif
		CreateScreenElement {
			Type = TextElement
			PARENT = <vparent>
			font = fontgrid_title_gh3
			Scale = (0.8, 0.75)
			rgba = ($menu_unfocus_color)
			Text = "ENTER VAULT"
			just = [Center Top]
			event_handlers = [
				{Focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <show_change_outfit>
					}
				}
				{Focus SetScreenElementProps Params = {Id = ch_gc_logo rgba = (($G_menu_colors).md_violet_grey)}}
				{unfocus retail_menu_unfocus}
				{unfocus SetScreenElementProps Params = {Id = ch_gc_logo rgba = ($menu_unfocus_color)}}
				{pad_choose character_hub_select_the_store Params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			<demo_mode_disable>
		}
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		<logo_pos> = (394.0, 365.0)
		if (<show_change_outfit>)
			<logo_pos> = (<logo_pos> + (0.0, 45.0))
		endif
		CreateScreenElement {
			Type = SpriteElement
			Id = ch_gc_logo
			PARENT = character_hub_p1_container
			Pos = <logo_pos>
			texture = logo_guitarcenter_128
			rgba = ($menu_unfocus_color)
			just = [Center Top]
			Dims = (192.0, 96.0)
			Z = 0
		}
	endif
	Change \{g_hub_destroy = 0}
	if ($using_guitar_select_camera = 1)
		SetScreenElementProps Id = <bookEnd1ID> Hide preserve_flip
		SetScreenElementProps Id = <bookEnd2ID> Hide
		SetScreenElementProps Id = <whiteTexHighlightID> Hide
		LaunchEvent Type = unfocus Target = <vparent>
		Change \{using_guitar_select_camera = 0}
		PlayIGCCam \{Id = gs_view_cam_id
			Name = gs_view_cam
			viewport = Bg_Viewport
			ControlScript = guitar_select_exit_camera_morph
			Play_hold = 1
			interrupt_current}
		wait_for_guitar_select_exit_camera
		KillCamAnim \{Name = gs_view_cam}
		if CompositeObjectExists \{Name = GUITARIST}
			if NOT ($guitarist_info.stance = Stance_FrontEnd)
				Change \{StructureName = guitarist_info
					current_anim = IDLE}
				Change \{StructureName = guitarist_info
					cycle_anim = TRUE}
				Change \{StructureName = guitarist_info
					next_anim = NONE}
				GUITARIST :handle_change_stance \{stance = Stance_FrontEnd
					SPEED = 2.0
					No_wait}
			endif
		endif
		if CompositeObjectExists \{Name = BASSIST}
			if NOT ($bassist_info.stance = Stance_FrontEnd)
				if CompositeObjectExists \{Name = BASSIST}
					BASSIST :handle_change_stance \{stance = Stance_FrontEnd
						SPEED = 2.0
						No_wait}
				endif
			endif
		endif
		SetScreenElementProps Id = <bookEnd1ID> UnHide preserve_flip
		SetScreenElementProps Id = <bookEnd2ID> UnHide
		SetScreenElementProps Id = <whiteTexHighlightID> UnHide
	endif
	LaunchEvent Type = Focus Target = <vparent>
	Change \{menu_flow_locked = 0}
endscript

script character_hub_highlighter \{comi = 1
		chh_mp = 0
		chh_player = 1}
	if ($current_num_players = 1)
		retail_menu_focus
	endif
	if (<chh_mp> = 0)
		<Y> = (167 + (47 * <menuItemNum>))
		SetScreenElementProps Id = <be1ID> Pos = ((231.0, 0.0) + (<Y> * (0.0, 1.0))) preserve_flip
		SetScreenElementProps Id = <be2ID> Pos = ((554.0, 0.0) + (<Y> * (0.0, 1.0)))
		SetScreenElementProps Id = <wthlID> Pos = ((261.0, 0.0) + (<Y> * (0.0, 1.0)) + (0.0, 0.0))
	elseif (<chh_mp> = 1)
		if (<chh_player> = 1)
			<offset_pos> = (0.0, 0.0)
		else
			<offset_pos> = (350.0, 0.0)
		endif
		if NOT (<comi>)
			<initial_pos> = (302.0, 479.0)
		else
			<initial_pos> = (302.0, 439.0)
		endif
		<r_bookend_offset> = (312.0, 0.0)
		<vertical_offset> = (0.0, 47.25)
		<highlight_offset> = (25.0, 0.0)
		if ($game_mode = p2_quickplay || $game_mode = p2_coop)
			<initial_pos> = (<initial_pos> + (0.0, -40.0))
		endif
		SetScreenElementProps Id = <be1ID> Pos = (<initial_pos> + (<menuItemNum> * <vertical_offset>) + <offset_pos>) preserve_flip
		SetScreenElementProps Id = <be2ID> Pos = (<initial_pos> + (<menuItemNum> * <vertical_offset>) + <r_bookend_offset> + <offset_pos>)
		SetScreenElementProps Id = <wthlID> Pos = (<initial_pos> + (<menuItemNum> * <vertical_offset>) + <highlight_offset> + <offset_pos>)
	endif
endscript

script destroy_character_hub_menu \{Player = 1
		Destroy = 0}
	if (<Player> = 1)
		destroy_menu \{menu_id = scrolling_character_hub_p1}
		destroy_menu \{menu_id = character_hub_p1_container}
	else
		destroy_menu \{menu_id = scrolling_character_hub_p2}
		destroy_menu \{menu_id = character_hub_p2_container}
	endif
	KillCamAnim \{Name = gs_view_cam}
endscript

script character_hub_generic_sound 
	if (<Player> = 1)
		if ($p1_ready = 0)
			generic_menu_up_or_down_sound <...>
		endif
	else
		if ($p2_ready = 0)
			generic_menu_up_or_down_sound <...>
		endif
	endif
endscript

script character_hub_select_play_show 
	if (($current_num_players) = 2)
		if ((<Player> = 1) && ($p1_ready = 0))
			SetScreenElementProps \{Id = vmenu_character_hub_p1
				disable_pad_handling}
			Change \{p1_ready = 1}
			if ($is_network_game = 1)
				if ScreenElementExists \{Id = ready_container_p1}
					RunScriptOnScreenElement \{Id = ready_container_p1
						pos2 = (825.0, 450.0)
						drop_in_ready_sign
						Params = {
							Player = 1
						}}
				endif
			else
				drop_in_ready_sign \{Player = 1}
			endif
		endif
		if ((<Player> = 2) && ($p2_ready = 0))
			SetScreenElementProps \{Id = vmenu_character_hub_p2
				disable_pad_handling}
			Change \{p2_ready = 1}
			drop_in_ready_sign \{Player = 2}
		endif
	endif
	if ((($p1_ready = 1) && ($p2_ready = 1)) || ($current_num_players = 1))
		if ($is_network_game = 1)
			KillSpawnedScript \{Name = net_hub_stream}
			Wait \{0.4
				Seconds}
		endif
		if ScreenElementExists \{Id = vmenu_character_hub_p1}
			LaunchEvent \{Type = unfocus
				Target = vmenu_character_hub_p1}
		endif
		if ScreenElementExists \{Id = vmenu_character_hub_p2}
			LaunchEvent \{Type = unfocus
				Target = vmenu_character_hub_p2}
		endif
		clean_up_user_control_helpers
		shut_down_flow_manager \{Player = 2}
		shut_down_character_hub
		if (($is_network_game) = 1)
			ui_flow_manager_respond_to_action \{action = select_ready
				Player = 1
				create_params = {
					Player = 1
				}}
		else
			ui_flow_manager_respond_to_action \{action = select_play_show
				Player = 1
				create_params = {
					Player = 1
				}}
		endif
		Change \{p1_ready = 0}
		Change \{p2_ready = 0}
	endif
endscript

script character_hub_select_the_store 
	clean_up_user_control_helpers
	shut_down_flow_manager \{Player = 2}
	shut_down_character_hub
	ui_flow_manager_respond_to_action action = select_the_store create_params = {Player = <Player>}
endscript

script character_hub_select_change_outfit 
	if ($is_network_game)
		net_info_panel_hide
	endif
	ui_flow_manager_respond_to_action action = select_change_outfit Player = <Player> create_params = {Player = <Player>}
endscript

script net_info_panel_hide 
	if ScreenElementExists \{Id = net_game_info_panel}
		DoScreenElementMorph \{Id = net_game_info_panel
			Alpha = 0.0
			Time = 0.1}
	endif
endscript

script net_info_panel_show 
	if NOT ScreenElementExists \{Id = net_game_info_panel}
		return
	endif
	can_show = 1
	if ScreenElementExists \{Id = scrolling_select_outfit_p1}
		can_show = 0
	elseif ScreenElementExists \{Id = scrolling_select_outfit_p2}
		can_show = 0
	elseif ScreenElementExists \{Id = scrolling_select_guitar_p1}
		can_show = 0
	elseif ScreenElementExists \{Id = scrolling_select_guitar_p2}
		can_show = 0
	endif
	if (<can_show> = 1)
		DoScreenElementMorph \{Id = net_game_info_panel
			Alpha = 1.0
			Time = 0.1}
	endif
endscript

script character_hub_select_change_guitar 
	LaunchEvent Type = unfocus Target = <vparent>
	if ($is_network_game)
		net_info_panel_hide
	endif
	if ($current_num_players = 1)
		generic_select_monitor_wait
	endif
	if GotParam \{BASS}
		ui_flow_manager_respond_to_action action = select_change_guitar Player = <Player> create_params = {Player = <Player> instrument_type = BASS}
	else
		ui_flow_manager_respond_to_action action = select_change_guitar Player = <Player> create_params = {Player = <Player>}
	endif
endscript

script generic_select_monitor_wait 
	UnPauseSpawnedScript \{generic_select_monitor}
	FormatText \{ChecksumName = change_flag
		'generic_select_monitor_p%i_changed'
		I = 1}
	FormatText \{ChecksumName = change_flag2
		'generic_select_monitor_p%i_changed'
		I = 2}
	begin
	Printf "Waiting for %i %s" I = <change_flag> S = $<change_flag>
	if ($<change_flag> = 0)
		if ($current_num_players = 1 || $<change_flag2> = 0)
			break
		endif
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script generic_select_monitor_finish 
	Printf \{"generic_select_monitor_finish"}
	generic_select_monitor_wait
	KillSpawnedScript \{Name = generic_select_monitor}
endscript
generic_select_monitor_p1_changed = 0
generic_select_monitor_p2_changed = 0

script generic_select_monitor \{initial_load = 1
		node_flags = {
		}}
	async = 1
	if (<initial_load> = 1)
		Change GlobalName = <change_flag> NewValue = 1
	endif
	begin
	if ($<change_flag> = 1)
		Change GlobalName = <change_flag> NewValue = 2
		if NOT preload_band_member Name = <Name> UseOldPos async = <async> animpak = 0
			Change GlobalName = <change_flag> NewValue = 0
			DownloadContentLost
			return
		endif
		Printf "preload_band_member %i" I = <Name>
		if ($<change_flag> = 2)
			if NOT create_guitarist Name = <Name> UseOldPos no_strum async = <async> animpak = 0 <node_flags>
				Change GlobalName = <change_flag> NewValue = 0
				DownloadContentLost
				return
			endif
			Printf "create_guitarist %i" I = <Name>
		endif
		preload_band_member_finish Name = <Name> UseOldPos async = <async> animpak = 0 filename_crc = <filename_crc> instrument_crc = <instrument_crc>
		if ($<change_flag> = 2 &&
				<async> = 1)
			store_check_to_shadow
			<Name> :Obj_GetPosition
			<Name> :Obj_SetPosition Position = (0.0, -200.0, 0.0)
			Wait \{1
				GameFrame}
			<Name> :Obj_SetPosition Position = <Pos>
		endif
		if ($<change_flag> = 2)
			Change GlobalName = <change_flag> NewValue = 0
		endif
	else
		Wait \{1
			GameFrame}
	endif
	async = 1
	repeat
endscript

script create_select_guitar_finish_menu \{Player = 1}
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound Params = {UP}}
		{pad_down generic_menu_up_or_down_sound Params = {DOWN}}
		{pad_back menu_flow_go_back Params = {Player = <Player>}}
		{pad_start menu_show_gamercard}
	]
	if (<Player> = 1)
		if ($current_num_players = 2)
			new_menu scrollid = scrolling_select_finish_p1 vmenuid = vmenu_select_finish_p1 Name = "Select Guitar Finish" use_backdrop = 0 exclusive_device = <exclusive_dev> event_handlers = <event_handlers>
		else
			new_menu scrollid = scrolling_select_finish_p1 vmenuid = vmenu_select_finish_p1 Name = "Select Guitar Finish" use_backdrop = 0 event_handlers = <event_handlers>
		endif
		vparent = vmenu_select_finish_p1
	else
		new_menu scrollid = scrolling_select_finish_p2 vmenuid = vmenu_select_finish_p2 Name = "Select Guitar Finish" use_backdrop = 0 exclusive_device = <exclusive_dev> event_handlers = <event_handlers>
		vparent = vmenu_select_finish_p2
	endif
	if ($current_num_players = 2)
		CreateScreenElement {
			Type = TextElement
			PARENT = <vparent>
			font = text_A1
			Scale = 0.75
			rgba = [210 130 0 250]
			Text = ("Finish 1")
			just = [LEFT Top]
			event_handlers = [
				{Focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_character_hub Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		CreateScreenElement {
			Type = TextElement
			PARENT = <vparent>
			font = text_A1
			Scale = 0.75
			rgba = [210 130 0 250]
			Text = ("Finish 2")
			just = [LEFT Top]
			event_handlers = [
				{Focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_character_hub Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
	else
		CreateScreenElement {
			Type = TextElement
			PARENT = <vparent>
			font = text_A1
			Scale = 0.75
			rgba = [210 130 0 250]
			Text = ("Finish 1")
			just = [LEFT Top]
			event_handlers = [
				{Focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_character_hub Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
		}
		CreateScreenElement {
			Type = TextElement
			PARENT = <vparent>
			font = text_A1
			Scale = 0.75
			rgba = [210 130 0 250]
			Text = ("Finish 2")
			just = [LEFT Top]
			event_handlers = [
				{Focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_character_hub Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
		}
	endif
endscript

script destroy_select_guitar_finish_menu \{Player = 1}
	FormatText ChecksumName = scrolling_select_finish 'scrolling_select_finish_p%i' I = <Player>
	destroy_menu menu_id = <scrolling_select_finish>
endscript

script finish_select_highlight 
	retail_menu_focus
endscript
default_character_hub_pos = {
	p1_pos = (3.0, 0.0, 0.0)
	p1_2ppos = (1.75, 0.0, 0.0)
	p2_2ppos = (3.0, 0.0, 0.0)
}

script setup_character_hub 
	if ($g_hub_created = 1)
		return
	endif
	character_hub_pos = default_character_hub_pos
	destroy_bg_viewport
	setup_bg_viewport
	Destroy_Crowd_Models
	GetPakManCurrentName \{map = Zones}
	if GotParam \{pakname}
		if NOT (<pakname> = "z_soundcheck")
			ResetWaypoints
			SetPakManCurrentBlock \{map = Zones
				pak = Z_Soundcheck
				block_scripts = 1}
		endif
	else
		ResetWaypoints
		SetPakManCurrentBlock \{map = Zones
			pak = Z_Soundcheck
			block_scripts = 1}
	endif
	SafeCreate \{NodeName = Z_SoundCheck_GFX_TRG_LH_HotSpot01}
	player2_spotlight = Z_SoundCheck_GFX_TRG_LH_HotSpot_P2
	if ($current_num_players = 2)
		SafeCreate NodeName = <player2_spotlight>
	else
		SafeKill NodeName = <player2_spotlight>
	endif
	UnPauseGame
	disable_pause
	destroy_band
	Printf \{"Creating generic_select_monitor"}
	Player = 1
	begin
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
	if (<Player> = 1)
		Name = ($player1_status.band_Member)
	else
		Name = ($player2_status.band_Member)
	endif
	SpawnScriptNow generic_select_monitor Params = {Player = <Player> player_status = <player_status> change_flag = <change_flag> Name = <Name>}
	Player = (<Player> + 1)
	repeat ($current_num_players)
	StopRendering
	generic_select_monitor_wait
	StartRendering
	if CompositeObjectExists \{Name = DRUMMER}
		DRUMMER :Hide
	endif
	if CompositeObjectExists \{Name = guitarist2}
		guitarist2 :Hide
	endif
	if CompositeObjectExists \{Name = RHYTHM}
		RHYTHM :Hide
	endif
	if CompositeObjectExists \{Name = VOCALIST}
		VOCALIST :Hide
	endif
	if ($current_num_players = 1)
		if CompositeObjectExists \{Name = BASSIST}
			BASSIST :Hide
		endif
	else
		if CompositeObjectExists \{Name = BASSIST}
			BASSIST :UnHide
			BASSIST :Ragdoll_MarkForReset
		endif
		if (($is_network_game = 1) && ($player2_present = 0))
			if CompositeObjectExists \{Name = BASSIST}
				BASSIST :Hide
			endif
		endif
	endif
	if ($current_num_players = 2)
		($player1_status.band_Member) :Obj_SetPosition Position = ($<character_hub_pos>.p1_2ppos)
		($player2_status.band_Member) :Obj_SetPosition Position = ($<character_hub_pos>.p2_2ppos)
	endif
	if ViewportExists \{Id = Bg_Viewport}
		PlayIGCCam \{Id = cs_view_cam_id
			Name = ch_view_cam
			viewport = Bg_Viewport
			LockTo = World
			Pos = (2.503113, 1.0385579, 2.869411)
			Quat = (0.028074998, -0.999026, 0.020287)
			FOV = 78.0
			Play_hold = 1
			interrupt_current}
	endif
	Change \{g_hub_created = 1}
	SetShadowDirFromLight \{Name = Z_SoundCheck_GFX_Char_Front01}
endscript

script shut_down_character_hub 
	if ($g_hub_created = 0)
		return
	endif
	Change \{p1_ready = 0}
	Change \{p2_ready = 0}
	if ($shutdown_game_for_signin_change_flag = 1)
		KillSpawnedScript \{Name = setup_character_hub}
		Change \{using_guitar_select_camera = 0}
	endif
	generic_select_monitor_finish
	KillCamAnim \{Name = ch_view_cam}
	KillCamAnim \{Name = gs_view_cam}
	destroy_bg_viewport
	setup_bg_viewport
	disable_pause
	if CompositeObjectExists \{Name = DRUMMER}
		DRUMMER :UnHide
	endif
	if CompositeObjectExists \{Name = guitarist2}
		guitarist2 :UnHide
	endif
	if CompositeObjectExists \{Name = VOCALIST}
		VOCALIST :UnHide
	endif
	if CompositeObjectExists \{Name = BASSIST}
		BASSIST :UnHide
	endif
	destroy_band
	Change \{g_hub_created = 0}
endscript

script character_hub_go_back 
	if ($current_num_players = 2)
		leaving_character_hub = 1
		if ($game_mode = p2_quickplay || $game_mode = p2_coop)
			leaving_character_hub = 0
		elseif ($current_num_players = 2)
			leaving_character_hub = 0
		endif
		if (<leaving_character_hub> = 0)
			if (<Player> = 1)
				SetScreenElementProps \{Id = vmenu_character_hub_p1
					enable_pad_handling}
				Change \{p1_ready = 0}
				if ($is_network_game = 1)
					if ScreenElementExists \{Id = ready_container_p1}
						RunScriptOnScreenElement \{Id = ready_container_p1
							drop_out_ready_sign
							Params = {
								Player = 1
							}}
					endif
				else
					drop_out_ready_sign \{Player = 1}
				endif
			else
				SetScreenElementProps \{Id = vmenu_character_hub_p2
					enable_pad_handling}
				Change \{p2_ready = 0}
				drop_out_ready_sign \{Player = 2}
			endif
			ui_flow_manager_respond_to_action action = go_back create_params = {Player = <Player>} Player = <Player>
		endif
	else
		clean_up_user_control_helpers
		ui_flow_manager_respond_to_action Player = <Player> action = go_back
	endif
endscript

script get_num_character_outfits 
	if (<Player> = 1)
		find_profile_by_id Id = ($player1_status.character_id)
	else
		find_profile_by_id Id = ($player2_status.character_id)
	endif
	get_musician_profile_struct Index = <Index>
	Name = (<profile_struct>.Name)
	get_musician_profile_size
	Index = 0
	begin
	get_musician_profile_struct Index = <Index>
	if (<profile_struct>.Name = <Name>)
		GetArraySize (<profile_struct>.outfits)
		return num_character_outfits = <array_Size>
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
endscript

script get_num_outfit_styles \{outfit = 1}
	if (<Player> = 1)
		find_profile_by_id Id = ($player1_status.character_id)
	else
		find_profile_by_id Id = ($player2_status.character_id)
	endif
	get_musician_profile_struct Index = <Index>
	Name = (<profile_struct>.Name)
	get_musician_profile_size
	Index = 0
	begin
	get_musician_profile_struct Index = <Index>
	if (<profile_struct>.Name = <Name>)
		outfits = (<profile_struct>.outfits)
		GetArraySize (<outfits> [(<outfit> -1)].styles)
		return num_outfit_styles = <array_Size>
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
endscript

script get_character_outfits \{Player = 1}
	if GotParam \{character_id}
		find_profile_by_id Id = <character_id>
	else
		if (<Player> = 1)
			find_profile_by_id Id = ($player1_status.character_id)
		else
			find_profile_by_id Id = ($player2_status.character_id)
		endif
	endif
	get_musician_profile_struct Index = <Index>
	Name = (<profile_struct>.Name)
	get_musician_profile_size
	Index = 0
	begin
	get_musician_profile_struct Index = <Index>
	if (<profile_struct>.Name = <Name>)
		if StructureContains Structure = <profile_struct> Name = outfits
			return character_outfits = (<profile_struct>.outfits)
		else
			return \{no_outfits}
		endif
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{no_outfits}
endscript

script get_character_name \{Player = 1}
	if (<Player> = 1)
		find_profile_by_id Id = ($player1_status.character_id)
	else
		find_profile_by_id Id = ($player2_status.character_id)
	endif
	get_musician_profile_struct Index = <Index>
	return character_name = (<profile_struct>.Name) display_name = (<profile_struct>.fullname)
endscript

script get_character_outfit_name \{Player = 1}
	if (<Player> = 1)
		find_profile_by_id Id = ($player1_status.character_id)
		outfit_index = ($player1_status.outfit - 1)
	else
		find_profile_by_id Id = ($player2_status.character_id)
		outfit_index = ($player2_status.outfit - 1)
	endif
	get_musician_profile_struct Index = <Index>
	if StructureContains Structure = <profile_struct> Name = outfits
		return outfit_name = (<profile_struct>.outfits [<outfit_index>].Id)
	else
		return outfit_name = (<profile_struct>.Name)
	endif
endscript

script get_character_style_name \{Player = 1}
	if (<Player> = 1)
		find_profile_by_id Id = ($player1_status.character_id)
		outfit_index = ($player1_status.outfit - 1)
		style_index = ($player1_status.style - 1)
	else
		find_profile_by_id Id = ($player2_status.character_id)
		outfit_index = ($player2_status.outfit - 1)
		style_index = ($player1_status.style - 1)
	endif
	get_musician_profile_struct Index = <Index>
	return style_name = (<profile_struct>.outfits [<outfit_index>].styleids [<style_index>])
endscript

script net_outfit_menu_flow_go_back 
	menu_flow_go_back Player = <Player>
endscript

script net_style_menu_flow_go_back 
	menu_flow_go_back Player = <Player>
endscript
