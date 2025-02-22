info_text = [
	"Jump right into a Player Match and rock the house against the first rocker available."
	"Jump right into a Ranked Match and rock the house against the first rocker available."
	"Search for a specific type of online match."
	"Create and host your own online match."
	"Setup and make changes to your Quick Match Options."
	"Check out who the best of the best are and see where you rank."
	"Check out the newest available downloads for Guitar Hero 3."
	"Be a Guitar Hero, and join the online community!"
	"Select 'Message Of The Day' to see the latest news in the Guitar Hero universe."
]
online_main_menu_pos = (470.0, 110.0)
online_info_pane_pos = (922.0, 186.0)
mnm_frame_id = NULL

script create_online_main_menu \{menu_title_xenon = "Xbox LIVE"
		menu_title_ps3 = "ONLINE"
		menu_id = online_main_menu
		vmenu_id = online_main_vmenu}
	online_menu_init
	Change \{rich_presence_context = presence_main_menu}
	SpawnScriptNow \{Menu_Music_On}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = main_menu_anchor
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = VScrollingMenu
		PARENT = main_menu_anchor
		Id = <menu_id>
		just = [Center Top]
		Dims = (400.0, 480.0)
		Pos = (($online_main_menu_pos) + (0.0, 75.0))
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		Pos = (47.5, 0.0)
		just = [LEFT Top]
		internal_just = [Center Top]
		Dims = (400.0, 480.0)
		event_handlers = [
			{pad_back return_from_online_main_menu}
			{pad_back generic_menu_pad_back}
			{pad_up generic_menu_up_or_down_sound Params = {UP}}
			{pad_down generic_menu_up_or_down_sound Params = {DOWN}}
		]
		exclusive_device = ($primary_controller)
	}
	CreateScreenElement \{Type = ContainerElement
		PARENT = main_menu_anchor
		Id = online_main_menu_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = ContainerElement
		PARENT = online_main_menu_container
		Id = online_main_menu_text_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = ContainerElement
		PARENT = main_menu_anchor
		Id = online_info_pane_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = ContainerElement
		PARENT = online_info_pane_container
		Id = online_info_pane_text_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Online_Background}
	CreateScreenElement \{Type = ContainerElement
		PARENT = online_main_menu_container
		Id = online_main_menu_frame_container
		Pos = (0.0, 0.0)
		Alpha = 0}
	Change mnm_frame_id = <Id>
	frame_dims = (840.0, 600.0)
	center_pos = (($online_main_menu_pos) + (170.0, 266.0))
	create_UI_frame {
		PARENT = online_main_menu_frame_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = ($online_medium_blue)
		fill_rgba = (($G_menu_colors).online_fill_rgba)
		z_priority = 2
		suffix = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = Online_Frame_Crown
		PARENT = online_main_menu_frame_container
		texture = Online_Frame_Crown
		Pos = (($online_main_menu_pos) + (170.0, -76.0))
		Dims = (256.0, 105.0)
		just = [Center Top]
		z_priority = 3
	}
	CreateScreenElement \{Type = ContainerElement
		PARENT = online_info_pane_container
		Id = online_info_pane_frame_container
		Pos = (0.0, 0.0)}
	frame_dims = (320.0, 340.0)
	center_pos = (($online_info_pane_pos) + (-10.0, 150.0))
	create_UI_frame {
		PARENT = online_info_pane_frame_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = ($online_medium_blue)
		fill_rgba = (($G_menu_colors).online_fill_rgba)
		z_priority = 5
		suffix = 1
	}
	if IsXENON
		CreateScreenElement {
			Type = TextElement
			PARENT = online_main_menu_text_container
			Id = online_title
			font = fontgrid_title_gh3
			Scale = 1.2
			rgba = ($online_light_purple)
			Pos = (($online_main_menu_pos) + (0.0, 15.0))
			Text = <menu_title_xenon>
			just = [Center Top]
			z_priority = 4.0
			Shadow
			shadow_offs = (5.0, 5.0)
		}
	else
		CreateScreenElement {
			Type = TextElement
			PARENT = online_main_menu_text_container
			Id = online_title
			font = fontgrid_title_gh3
			Scale = 1.2
			rgba = ($online_light_purple)
			Pos = (($online_main_menu_pos) + (0.0, 15.0))
			Text = <menu_title_ps3>
			just = [Center Top]
			z_priority = 4.0
			Shadow
			shadow_offs = (5.0, 5.0)
		}
	endif
	GetScreenElementDims Id = <Id>
	if (<width> > 420)
		SetScreenElementProps {
			Id = <Id>
			Scale = 1.0
		}
		scale_element_to_size {
			Id = <Id>
			target_width = 420
			target_height = <Height>
		}
	endif
	if IsXENON
		net_add_item_to_main_menu {
			VMenu = <vmenu_id>
			Text = "QUICK MATCH: PLAYER"
			info_text_index = 0
			pad_choose_script = online_menu_select_quickmatch_player
		}
		net_add_item_to_main_menu {
			VMenu = <vmenu_id>
			Text = "QUICK MATCH: RANKED"
			info_text_index = 1
			pad_choose_script = online_menu_select_quickmatch_ranked
		}
	else
		net_add_item_to_main_menu {
			VMenu = <vmenu_id>
			Text = "QUICK MATCH"
			info_text_index = 0
			pad_choose_script = online_menu_select_quickmatch_player
		}
	endif
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "CREATE MATCH"
		info_text_index = 3
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_create_match}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "LEADERBOARDS"
		info_text_index = 5
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_leaderboards}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "WWW.GUITARHERO.COM"
		info_text_index = 7
		pad_choose_script = online_menu_select_website
		pad_choose_script2 = SoundEvent
		choose_script_params2 = {Event = ui_sfx_select}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "MESSAGE OF THE DAY"
		info_text_index = 8
		pad_choose_script = online_menu_select_motd
		pad_choose_script2 = SoundEvent
		choose_script_params2 = {Event = ui_sfx_select}
	}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = online_info_pane_text_container
		Id = help_info_text_block
		font = text_a4
		Scale = (0.75, 0.65000004)
		rgba = ($online_light_blue)
		Text = ($info_text [0])
		just = [Center Center]
		internal_just = [Center Center]
		z_priority = 6.0
		Pos = (($online_info_pane_pos) + (-12.0, 140.0))
		Dims = (320.0, 340.0)
	}
	CreateScreenElement \{Type = WindowElement
		PARENT = main_menu_anchor
		Id = motd_ticker_window
		Pos = (0.0, 590.0)
		Dims = (1280.0, 40.0)
		just = [
			LEFT
			Top
		]}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = motd_ticker_window
		texture = White
		Pos = (0.0, 0.0)
		Dims = (1280.0, 40.0)
		just = [LEFT Top]
		rgba = (($G_menu_colors).online_fill_rgba)
	}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = motd_ticker_window
		Id = motd_ticker_text_block
		just = [LEFT Top]
		internal_just = [LEFT Top]
		Pos = (1280.0, 0.0)
		Scale = (0.65000004, 0.55)
		Text = ""
		font = text_a4
		rgba = ($online_light_purple)
		z_priority = 100
		Dims = (1280.0, 64.0)
		line_spacing = 1.0
		allow_expansion
	}
	SpawnScriptNow \{get_motd_and_start_ticker}
	if NOT IsXENON
		if NOT NetSessionFunc \{Obj = voice
				func = voice_allowed}
			CreateScreenElement {
				Type = TextBlockElement
				PARENT = online_info_pane_container
				just = [Center Top]
				internal_just = [Center Top]
				Pos = (640.0, 530.0)
				Scale = (0.55, 0.55)
				Text = "Chat is disabled on your PLAYSTATION®Network account due to parental control restrictions."
				font = text_a4
				rgba = ($online_light_blue)
				z_priority = 6.0
				Dims = (1500.0, 120.0)
			}
		endif
	endif
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	create_online_main_menu_helper_buttons
	LaunchEvent Type = Focus Target = <vmenu_id>
endscript

script destroy_online_main_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenElementExists \{Id = main_menu_anchor}
		DestroyScreenElement \{Id = main_menu_anchor}
	endif
	KillSpawnedScript \{Name = scroll_motd_ticker}
endscript

script create_online_main_menu_helper_buttons 
	if ($num_user_control_helpers > 0)
		clean_up_user_control_helpers
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
	add_user_control_helper \{Text = "SELECT"
		button = Green
		Z = 100}
	add_user_control_helper \{Text = "BACK"
		button = RED
		Z = 100}
	add_user_control_helper \{Text = "UP/DOWN"
		button = Strumbar
		Z = 100}
endscript

script get_motd_and_start_ticker 
	if ($retrieved_message_of_the_day = 0)
		NetSessionFunc \{Obj = MOTD
			func = get_demonware_motd
			Params = {
				callback = motd_callback
			}}
	else
		SpawnScriptNow \{scroll_motd_ticker
			Params = {
				Id = motd_ticker_text_block
			}}
	endif
endscript

script motd_callback 
	if GotParam \{motd_text}
		Change \{retrieved_message_of_the_day = 1}
		Change message_of_the_day = <motd_text>
		if ScreenElementExists \{Id = motd_ticker_text_block}
			motd_ticker_text_block :SetProps Text = ($message_of_the_day)
			SpawnScriptNow \{scroll_motd_ticker
				Params = {
					Id = motd_ticker_text_block
				}}
		endif
	endif
endscript
g_motd_start_pos_x = 0
g_motd_end_pos_x = 0

script scroll_motd_ticker \{scroll_time = 8}
	this_ID = <Id>
	FormatText TextName = msg_text "\\c1MESSAGE OF THE DAY:\\c0 %t" T = ($message_of_the_day)
	<this_ID> :SetProps Text = <msg_text>
	GetScreenElementChildren Id = <this_ID>
	GetArraySize (<children>)
	<start_pos> = (1280.0, 0.0)
	<motd_font> = text_a4
	CreateScreenElement {
		Type = TextElement
		PARENT = motd_ticker_window
		Scale = (0.65000004, 0.55)
		Text = " "
		font = <motd_font>
	}
	GetScreenElementDims Id = <Id>
	<space_width> = <width>
	end_pos = (0.0, 0.0)
	<I> = 0
	begin
	(<children> [<I>]) :Text_GetString
	GetUpperCaseString <String>
	FormatText ChecksumName = motd_ticker_text 'motd_ticker_text_%i' I = <I>
	if ScreenElementExists Id = <motd_ticker_text>
		DestroyScreenElement Id = <motd_ticker_text>
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = motd_ticker_window
		Id = <motd_ticker_text>
		just = [LEFT Top]
		internal_just = [LEFT Top]
		Scale = (0.65000004, 0.55)
		Text = <UpperCaseString>
		font = text_a4
		rgba = ($online_light_purple)
		z_priority = 100
		override_encoded_alpha
	}
	GetScreenElementDims Id = <motd_ticker_text>
	<new_width> = (<width> + <space_width>)
	<end_pos> = (<end_pos> - (<new_width> * (1.0, 0.0)))
	<I> = (<I> + 1)
	repeat <array_Size>
	Change \{g_motd_start_pos_x = 1280}
	Change g_motd_end_pos_x = (<end_pos>.(1.0, 0.0))
	<time_factor> = (1280 / <scroll_time>)
	<scroll_time> = ((1280 - $g_motd_end_pos_x) / <time_factor>)
	begin
	<start_pos> = ($g_motd_start_pos_x * (1.0, 0.0))
	<end_pos> = ($g_motd_end_pos_x * (1.0, 0.0))
	<I> = 0
	begin
	FormatText ChecksumName = motd_ticker_text 'motd_ticker_text_%i' I = <I>
	SpawnScriptNow scroll_motd_each_line Params = {Id = <motd_ticker_text> start_pos = <start_pos> end_pos = <end_pos> scroll_time = <scroll_time>}
	GetScreenElementDims Id = <motd_ticker_text>
	<new_width> = (<width> + <space_width>)
	start_pos = (<start_pos> + (<new_width> * (1.0, 0.0)))
	end_pos = (<end_pos> + (<new_width> * (1.0, 0.0)))
	<I> = (<I> + 1)
	repeat <array_Size>
	Wait <scroll_time> Seconds
	repeat
endscript

script scroll_motd_each_line 
	<Id> :SetProps Pos = <start_pos>
	<Id> :DoMorph Pos = <end_pos> Time = <scroll_time>
	return
endscript

script return_from_online_main_menu 
	Printf \{"--- deinitializing network layer"}
	shut_down_net_play
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script online_menu_select_quickmatch_player 
	Change \{match_type = Player}
	set_network_preferences
	ui_flow_manager_respond_to_action \{action = select_quickmatch_player}
endscript

script online_menu_select_quickmatch_ranked 
	Change \{match_type = Ranked}
	set_network_preferences
	ui_flow_manager_respond_to_action \{action = select_quickmatch_ranked}
endscript

script online_menu_select_options 
	ui_flow_manager_respond_to_action \{action = select_online_options}
endscript

script lobby_connection_lost 
	Printf \{"---lobby_connection_lost performing net cleanup"}
	EndGameNetScriptPump
	if NOT (IsHost)
		quit_network_game
		setup_sessionfuncs
		destroy_popup_warning_menu
		ui_flow_manager_respond_to_action \{action = connection_lost}
	endif
endscript

script online_menu_select_website 
	create_link_text
	hide_unhide_menu_elements \{Id = online_info_pane_container
		Time = 0.2
		Hide}
	Wait \{0.1
		Seconds}
	hide_unhide_menu_elements \{Id = online_main_menu_text_container
		Time = 0.2
		Hide}
	hide_unhide_menu_elements \{Id = online_main_vmenu
		Time = 0.2
		Hide}
	translate_and_scale_online_menu
	Wait \{0.3
		Seconds}
	if ScreenElementExists \{Id = gh_link_container}
		RunScriptOnScreenElement \{Id = gh_link_container
			DoScreenElementMorph
			Params = {
				Id = gh_link_container
				Alpha = 1.0
				Time = 0.2
			}}
	endif
	ghlink_vmenu :SetProps \{enable_pad_handling}
	LaunchEvent \{Type = Focus
		Target = ghlink_vmenu}
endscript

script online_menu_unselect_website 
	if ScreenElementExists \{Id = gh_link_container}
		RunScriptOnScreenElement \{Id = gh_link_container
			DoScreenElementMorph
			Params = {
				Id = gh_link_container
				Alpha = 0.0
				Time = 0.2
			}}
	endif
	Wait \{0.3
		Seconds}
	if ScreenElementExists \{Id = gh_link_container}
		DestroyScreenElement \{Id = gh_link_container}
	endif
	translate_and_scale_online_menu \{revert}
	hide_unhide_menu_elements \{Id = online_main_menu_text_container
		Time = 0.2}
	hide_unhide_menu_elements \{Id = online_main_vmenu
		Time = 0.2}
	Wait \{0.1
		Seconds}
	hide_unhide_menu_elements \{Id = online_info_pane_container
		Time = 0.2}
	Wait \{0.3
		Seconds}
	LaunchEvent \{Type = Focus
		Target = online_main_vmenu}
endscript

script create_link_text 
	CreateScreenElement \{Type = ContainerElement
		PARENT = online_main_menu_container
		Id = gh_link_container
		Pos = (40.0, 42.0)
		Scale = 0.95}
	CreateScreenElement \{Type = VScrollingMenu
		PARENT = gh_link_container
		Id = ghlink
		just = [
			Center
			Top
		]
		Dims = (400.0, 480.0)
		Pos = (320.0, 200.0)
		z_priority = 1}
	CreateScreenElement {
		Type = VMenu
		PARENT = ghlink
		Id = ghlink_vmenu
		Pos = (0.0, 0.0)
		just = [LEFT Top]
		internal_just = [Center Top]
		Dims = (400.0, 480.0)
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back SoundEvent Params = {Event = Generic_Menu_Back_SFX}}
			{pad_back online_menu_unselect_website}
			{pad_back clean_up_user_control_helpers}
			{pad_back create_online_main_menu_helper_buttons}
		]
	}
	<Id> :SetProps disable_pad_handling
	CreateScreenElement {
		Type = TextElement
		PARENT = gh_link_container
		Id = gh_link_title
		font = fontgrid_title_gh3
		Scale = 1.05
		rgba = ($online_light_purple)
		Text = "WWW.GUITARHERO.COM"
		just = [Center Top]
		Pos = (630.0, 111.0)
		z_priority = 4.0
	}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = gh_link_container
		font = text_a4
		Scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		Text = "Ready to Be a Guitar Hero? \\nHere's how to link your stats to the web community:"
		just = [Center Top]
		internal_just = [Center Top]
		z_priority = 6.0
		Pos = (630.0, 160.0)
		Dims = (950.0, 200.0)
	}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = gh_link_container
		font = text_a4
		Scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		Text = "- Go to www.guitarhero.com\\n- Create a New Account or Log in\\n- Click 'Link Account'\\n- Enter the following VIP Passcode"
		just = [Center Top]
		internal_just = [LEFT Top]
		z_priority = 6.0
		Pos = (660.0, 240.0)
		Dims = (1010.0, 600.0)
	}
	NetSessionFunc \{func = get_agora_token}
	FormatText TextName = vip_code "%a" A = <Token>
	CreateScreenElement {
		Type = TextElement
		PARENT = gh_link_container
		font = text_a3
		Scale = 1.25
		rgba = ($online_light_blue)
		Text = <vip_code>
		just = [Center Top]
		z_priority = 6.0
		Pos = (630.0, 410.0)
		font_spacing = 5
	}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = gh_link_container
		font = text_a4
		Scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		Text = "On the web you can personalize your profile, browse leaderboards, jam with an online band, collect groupies, and rock out in tournaments!"
		just = [Center Top]
		internal_just = [LEFT Top]
		z_priority = 6.0
		Pos = (638.0, 460.0)
		Dims = (950.0, 600.0)
	}
	if ScreenElementExists \{Id = gh_link_container}
		RunScriptOnScreenElement \{Id = gh_link_container
			DoScreenElementMorph
			Params = {
				Id = gh_link_container
				Alpha = 0.0
			}}
	endif
	clean_up_user_control_helpers
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
	add_user_control_helper \{Text = "BACK"
		button = RED
		Z = 100}
	LaunchEvent \{Type = unfocus
		Target = online_main_vmenu}
endscript

script online_menu_select_motd 
	create_motd_text
	hide_unhide_menu_elements \{Id = online_main_menu_container
		Time = 0.2
		Hide}
	hide_unhide_menu_elements \{Id = online_main_vmenu
		Time = 0.2
		Hide}
	Wait \{0.1
		Seconds}
	hide_unhide_menu_elements \{Id = online_info_pane_text_container
		Time = 0.2
		Hide}
	translate_and_scale_info_pane
	Wait \{0.3
		Seconds}
	if ScreenElementExists \{Id = MOTD_Container}
		RunScriptOnScreenElement \{Id = MOTD_Container
			DoScreenElementMorph
			Params = {
				Id = MOTD_Container
				Alpha = 1.0
				Time = 0.2
			}}
	endif
	LaunchEvent \{Type = Focus
		Target = motd_vmenu}
	motd_vmenu :SetProps \{enable_pad_handling}
endscript

script online_menu_unselect_motd 
	if ScreenElementExists \{Id = MOTD_Container}
		RunScriptOnScreenElement \{Id = MOTD_Container
			DoScreenElementMorph
			Params = {
				Id = MOTD_Container
				Alpha = 0.0
				Time = 0.2
			}}
	endif
	Wait \{0.3
		Seconds}
	destroy_menu \{menu_id = motd_scroller}
	if ScreenElementExists \{Id = MOTD_Container}
		DestroyScreenElement \{Id = MOTD_Container}
	endif
	translate_and_scale_info_pane \{revert}
	hide_unhide_menu_elements \{Id = online_info_pane_text_container
		Time = 0.2}
	Wait \{0.1
		Seconds}
	hide_unhide_menu_elements \{Id = online_main_vmenu
		Time = 0.2}
	hide_unhide_menu_elements \{Id = online_main_menu_container
		Time = 0.2}
	Wait \{0.3
		Seconds}
	LaunchEvent \{Type = Focus
		Target = online_main_vmenu}
endscript

script create_motd_text 
	CreateScreenElement \{Type = ContainerElement
		PARENT = online_info_pane_container
		Id = MOTD_Container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = VScrollingMenu
		PARENT = MOTD_Container
		Id = motd_scroller
		just = [
			Center
			Top
		]
		Dims = (400.0, 480.0)
		Pos = (640.0, 0.0)
		z_priority = 1}
	CreateScreenElement {
		Type = VMenu
		PARENT = motd_scroller
		Id = motd_vmenu
		Pos = (0.0, 0.0)
		just = [LEFT Top]
		internal_just = [Center Top]
		Dims = (400.0, 480.0)
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back SoundEvent Params = {Event = Generic_Menu_Back_SFX}}
			{pad_back online_menu_unselect_motd}
			{pad_back clean_up_user_control_helpers}
			{pad_back create_online_main_menu_helper_buttons}
		]
	}
	<Id> :SetProps disable_pad_handling
	CreateScreenElement {
		Type = TextElement
		PARENT = MOTD_Container
		Id = gh_link_title
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_light_blue)
		Text = "MESSAGE OF THE DAY"
		just = [Center Top]
		Pos = (640.0, 160.0)
		z_priority = 10.0
	}
	CreateScreenElement \{Type = WindowElement
		PARENT = MOTD_Container
		Id = motd_info_scroll_window
		Pos = (633.0, 220.0)
		Dims = (500.0, 300.0)
		just = [
			Center
			Top
		]}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = motd_info_scroll_window
		Id = motd_info_text_block
		just = [Center Top]
		internal_just = [Center Top]
		Pos = (245.0, 0.0)
		Scale = (0.75, 0.55)
		Text = ($message_of_the_day)
		font = text_a4
		rgba = ($online_light_blue)
		z_priority = 100
		Dims = (670.0, 1500.0)
		line_spacing = 1.0
	}
	motd_info_text_block :Obj_SpawnScriptNow \{scroll_motd_info
		Params = {
			Id = motd_info_text_block
		}}
	if ScreenElementExists \{Id = MOTD_Container}
		MOTD_Container :SetProps \{Alpha = 0.0}
	endif
	clean_up_user_control_helpers
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
	add_user_control_helper \{Text = "BACK"
		button = RED
		Z = 100}
	LaunchEvent \{Type = unfocus
		Target = online_main_vmenu}
endscript

script scroll_motd_info \{scroll_time = 60}
	<end_pos> = (0.0, -1000.0)
	<this_ID> = <Id>
	GetScreenElementChildren Id = <this_ID>
	if GotParam \{children}
		GetArraySize (<children>)
		<line_nums> = <array_Size>
	else
		return
	endif
	if (<line_nums> > 10)
		begin
		begin
		Wait \{5
			Seconds}
		DoScreenElementMorph Id = <this_ID> Pos = <end_pos> Time = <scroll_time>
		Wait ((<line_nums> - 10) * 1.8) Seconds
		GetScreenElementProps Id = <this_ID>
		SetScreenElementProps Id = <this_ID> Pos = <Pos>
		Wait \{4.0
			Seconds}
		<this_ID> :DoMorph Alpha = 0 Time = 0.2
		<this_ID> :SetProps Pos = (0.0, 0.0)
		Wait \{0.5
			Seconds}
		<this_ID> :DoMorph Alpha = 1 Time = 0.2
		break
		repeat
		repeat
	endif
endscript

script translate_and_scale_online_menu 
	<frames> = 10
	<Time> = 0.3
	if NOT GotParam \{revert}
		motd_ticker_window :DoMorph Alpha = 0 Time = <Time>
		($mnm_frame_id) :DoMorph Alpha = 1 Time = <Time>
	else
		($mnm_frame_id) :DoMorph Alpha = 0 Time = <Time>
		motd_ticker_window :DoMorph Alpha = 1 Time = <Time>
	endif
endscript

script translate_and_scale_info_pane 
	<frames> = 10
	if NOT GotParam \{revert}
		SpawnScriptNow do_ui_frame_morph Params = {
			start_dims = (320.0, 340.0)
			end_dims = (830.0, 448.0)
			start_pos = (($online_info_pane_pos) + (-10.0, 150.0))
			end_pos = (($online_info_pane_pos) + (-280.0, 118.0))
			frame_rgba = ($online_medium_blue)
			fill_rgba = (($G_menu_colors).online_fill_rgba)
			frames = <frames>
			PARENT = online_info_pane_frame_container
			z_priority = 5
			suffix = 1
		}
		Wait (<frames> + 2) GameFrames
		KillSpawnedScript \{Name = do_ui_frame_morph}
	else
		SpawnScriptNow do_ui_frame_morph Params = {
			start_dims = (830.0, 448.0)
			end_dims = (320.0, 340.0)
			start_pos = (($online_info_pane_pos) + (-280.0, 118.0))
			end_pos = (($online_info_pane_pos) + (-10.0, 150.0))
			frame_rgba = ($online_medium_blue)
			fill_rgba = (($G_menu_colors).online_fill_rgba)
			frames = <frames>
			PARENT = online_info_pane_frame_container
			z_priority = 5
			suffix = 1
		}
		Wait (<frames> + 2) GameFrames
		KillSpawnedScript \{Name = do_ui_frame_morph}
	endif
endscript

script hide_unhide_menu_elements \{Time = 0.0}
	if ScreenElementExists Id = <Id>
		if GotParam \{Hide}
			RunScriptOnScreenElement Id = <Id> DoScreenElementMorph Params = {Alpha = 0.0 Time = <Time> Id = <Id>}
		else
			RunScriptOnScreenElement Id = <Id> DoScreenElementMorph Params = {Alpha = 1.0 Time = <Time> Id = <Id>}
		endif
	endif
endscript

script create_net_play_song_menu 
endscript

script destroy_net_play_song_menu 
endscript

script online_select_downloads 
	NetSessionFunc \{func = ShowMarketPlaceUI}
	wait_for_blade_complete
	SetPakManCurrentBlock \{map = Zones
		pak = NONE
		block_scripts = 1}
	destroy_band
	Downloads_UnloadContent
	ui_flow_manager_respond_to_action \{action = select_downloadable_content}
endscript

script net_add_item_to_main_menu 
	if IsXENON
		line_spacing = 40
	else
		line_spacing = 50
	endif
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <VMenu>
		Dims = ((100.0, 0.0) + (0.0, 1.0) * <line_spacing>)
		event_handlers = [
			{Focus net_main_menu_focus}
			{Focus SetScreenElementProps Params = {Id = help_info_text_block Text = ($info_text [<info_text_index>])}}
			{unfocus net_main_menu_unfocus}
		]
	}
	menu_item_container = <Id>
	if GotParam \{pad_choose_script}
		if GotParam \{choose_script_params}
			<menu_item_container> :SetProps event_handlers = [{pad_choose <pad_choose_script> Params = {<choose_script_params>}}]
		else
			<menu_item_container> :SetProps event_handlers = [{pad_choose <pad_choose_script>}]
		endif
	endif
	if GotParam \{pad_choose_script2}
		if GotParam \{choose_script_params2}
			<menu_item_container> :SetProps event_handlers = [{pad_choose <pad_choose_script2> Params = {<choose_script_params2>}}]
		else
			<menu_item_container> :SetProps event_handlers = [{pad_choose <pad_choose_script2>}]
		endif
	endif
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <menu_item_container>
		local_id = highlightbar
		texture = hilite_bar_01
		Dims = (450.0, 40.0)
		rgba = ($online_light_blue)
		Pos = (0.0, 15.0)
		just = [Center Center]
		z_priority = 3
		Alpha = 0.0
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <menu_item_container>
		local_id = left_bookend
		texture = character_hub_hilite_bookend
		Dims = (30.0, 40.0)
		rgba = ($online_light_blue)
		Pos = (-225.0, 15.0)
		just = [RIGHT Center]
		z_priority = 3
		Alpha = 0.0
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <menu_item_container>
		local_id = right_bookend
		texture = character_hub_hilite_bookend
		Dims = (30.0, 40.0)
		rgba = ($online_light_blue)
		Pos = (225.0, 15.0)
		just = [LEFT Center]
		z_priority = 3
		Alpha = 0.0
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <menu_item_container>
		local_id = Text
		font = fontgrid_title_gh3
		Scale = 0.75
		rgba = ($online_light_blue)
		Text = <Text>
		just = [Center Top]
		z_priority = 4.0
		Shadow
		shadow_offs = (2.0, 2.0)
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 420)
		SetScreenElementProps {
			Id = <Id>
			Scale = 1.0
		}
		scale_element_to_size {
			Id = <Id>
			target_width = 420
			target_height = <Height>
		}
	endif
endscript

script net_main_menu_focus 
	Obj_GetID
	if ScreenElementExists Id = {<ObjID> child = highlightbar}
		SetScreenElementProps {
			Id = {<ObjID> child = highlightbar}
			Alpha = 1.0
		}
	endif
	if ScreenElementExists Id = {<ObjID> child = left_bookend}
		SetScreenElementProps {
			Id = {<ObjID> child = left_bookend}
			Alpha = 1.0
			preserve_flip
		}
	endif
	if ScreenElementExists Id = {<ObjID> child = right_bookend}
		SetScreenElementProps {
			Id = {<ObjID> child = right_bookend}
			Alpha = 1.0
		}
	endif
	if ScreenElementExists Id = {<ObjID> child = Text}
		SetScreenElementProps {
			Id = {<ObjID> child = Text}
			rgba = ($online_dark_purple)
			shadow_rgba = ($online_light_blue)
		}
	endif
endscript

script net_main_menu_unfocus 
	Obj_GetID
	if ScreenElementExists Id = {<ObjID> child = highlightbar}
		SetScreenElementProps {
			Id = {<ObjID> child = highlightbar}
			Alpha = 0.0
		}
	endif
	if ScreenElementExists Id = {<ObjID> child = left_bookend}
		SetScreenElementProps {
			Id = {<ObjID> child = left_bookend}
			Alpha = 0.0
			preserve_flip
		}
	endif
	if ScreenElementExists Id = {<ObjID> child = right_bookend}
		SetScreenElementProps {
			Id = {<ObjID> child = right_bookend}
			Alpha = 0.0
		}
	endif
	if ScreenElementExists Id = {<ObjID> child = Text}
		SetScreenElementProps {
			Id = {<ObjID> child = Text}
			rgba = ($online_light_blue)
			shadow_rgba = [0 0 0 255]
		}
	endif
endscript
