
script create_select_num_songs_menu \{menu_title = "CREATE MATCH"
		menu_subtitle = "NUMBER OF SONGS"
		menu_id = create_num_songs_menu
		vmenu_id = create_num_songs_vmenu}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = online_menu_ui_container
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = VScrollingMenu
		PARENT = online_menu_ui_container
		Id = <menu_id>
		just = [Center Top]
		Dims = (256.0, 350.0)
		Pos = (($online_general_menu_pos) + (0.0, 182.0))
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		Pos = ((128.0, 0.0) + (0.0, 0.0))
		just = [Center Top]
		internal_just = [Center Center]
		Dims = (256.0, 350.0)
		padding_scale = 1.0
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action Params = {action = go_back}}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound Params = {UP}}
			{pad_down generic_menu_up_or_down_sound Params = {DOWN}}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = Online_Background}
	frame_dims = (280.0, 600.0)
	center_pos = (($online_general_menu_pos) + (0.0, 300.0))
	create_UI_frame {
		PARENT = online_menu_ui_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = ($online_medium_blue)
		fill_rgba = (($G_menu_colors).online_fill_rgba)
		z_priority = 2
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = Online_Frame_Crown
		PARENT = online_menu_ui_container
		texture = Online_Frame_Crown
		Pos = (($online_general_menu_pos) + (2.0, -28.0))
		Dims = (192.0, 96.0)
		just = [Center Top]
		z_priority = 3
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = online_title_bar
		PARENT = online_menu_ui_container
		texture = Char_Select_Frame_BG2
		rgba = ($online_light_blue)
		Pos = (($online_general_menu_pos) + (0.0, 158.0))
		Dims = (268.0, 128.0)
		just = [Center Center]
		z_priority = 3
	}
	displaySprite Id = online_highlight PARENT = online_menu_ui_container tex = hilite_bar_01 rgba = ($online_light_blue) Pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (632.0, 0.0)) Dims = (288.0, 40.0) just = [Center Top] Z = 3
	displaySprite Id = online_bookend1 PARENT = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue) Pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (502.0, 20.0)) Dims = (40.0, 40.0) just = [Center Center] Z = 3 flip_v
	displaySprite Id = online_bookend2 PARENT = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue) Pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (774.0, 20.0)) Dims = (40.0, 40.0) just = [Center Center] Z = 3
	CreateScreenElement {
		Type = TextElement
		PARENT = online_menu_ui_container
		font = text_a4
		Scale = (0.65000004, 0.75)
		rgba = ($online_medium_blue)
		Text = <menu_title>
		just = [Center Top]
		Pos = (($online_general_menu_pos) + (0.0, 56.0))
		z_priority = 3.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 223
	CreateScreenElement {
		Type = TextElement
		PARENT = online_menu_ui_container
		font = fontgrid_title_gh3
		Scale = (0.65000004, 0.8)
		rgba = ($online_dark_purple)
		Text = <menu_subtitle>
		just = [Center Top]
		Pos = (($online_general_menu_pos) + (0.0, 140.0))
		z_priority = 4.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 243
	selectable_menu_items = 0
	CreateScreenElement {
		Type = TextElement
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		Text = "1"
		just = [LEFT Top]
		z_priority = 4.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 223
	<Id> :SetTags menu_item = <selectable_menu_items>
	<Id> :SetProps event_handlers = [
		{Focus online_general_menu_focus Params = {Id = <Id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_num_songs Params = {Type = num_1}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	if ($game_mode = p2_coop)
		FormatText \{TextName = option_text_num3
			"3"}
	else
		FormatText \{TextName = option_text_num3
			"Best of 3"}
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		Text = <option_text_num3>
		just = [LEFT Top]
		z_priority = 4.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 223
	<Id> :SetTags menu_item = <selectable_menu_items>
	<Id> :SetProps event_handlers = [
		{Focus online_general_menu_focus Params = {Id = <Id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_num_songs Params = {Type = num_3}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	if ($game_mode = p2_coop)
		FormatText \{TextName = option_text_num5
			"5"}
	else
		FormatText \{TextName = option_text_num5
			"Best of 5"}
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		Text = <option_text_num5>
		just = [LEFT Top]
		z_priority = 4.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 223
	<Id> :SetTags menu_item = <selectable_menu_items>
	<Id> :SetProps event_handlers = [
		{Focus online_general_menu_focus Params = {Id = <Id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_num_songs Params = {Type = num_5}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	if ($game_mode = p2_coop)
		FormatText \{TextName = option_text_num7
			"7"}
	else
		FormatText \{TextName = option_text_num7
			"Best of 7"}
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		Text = <option_text_num7>
		just = [LEFT Top]
		z_priority = 4.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 223
	<Id> :SetTags menu_item = <selectable_menu_items>
	<Id> :SetProps event_handlers = [
		{Focus online_general_menu_focus Params = {Id = <Id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_num_songs Params = {Type = num_7}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	set_online_menu_highlight_pos Menu_items = <selectable_menu_items>
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
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
	LaunchEvent Type = Focus Target = <vmenu_id>
endscript

script destroy_select_num_songs_menu 
	if ScreenElementExists \{Id = online_menu_ui_container}
		DestroyScreenElement \{Id = online_menu_ui_container}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script select_num_songs 
	Change num_songs = <Type>
	ui_flow_manager_respond_to_action \{action = Continue}
endscript
