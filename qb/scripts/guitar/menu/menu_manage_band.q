manage_band_menu_font = text_a4

script create_manage_band_menu 
	get_band_game_mode_name
	FormatText ChecksumName = bandname_id 'band%i_info_%g' I = ($current_band) G = <game_mode_name>
	GetGlobalTags <bandname_id>
	FormatText TextName = the_bands_name "''%n''" N = <Name>
	new_menu \{scrollid = mb_scroll
		vmenuid = mb_vmenu
		use_backdrop = 0
		Menu_pos = (732.0, 322.0)
		Rot_Angle = -2
		Spacing = 1}
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		Id = mb_helper_container
		PARENT = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = ContainerElement
		Id = mb_menu_container
		PARENT = mb_vmenu
		Pos = (0.0, 0.0)
		NOT_FOCUSABLE}
	CreateScreenElement \{Type = SpriteElement
		PARENT = mb_helper_container
		Id = light_overlay
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		Dims = (1280.0, 720.0)
		just = [
			Center
			Center
		]
		z_priority = 99}
	CreateScreenElement \{Type = SpriteElement
		PARENT = mb_helper_container
		Id = ticket_image
		texture = band_name_ticket
		rgba = [
			255
			255
			255
			255
		]
		Pos = (640.0, 360.0)
		Dims = (1280.0, 720.0)
		just = [
			Center
			Center
		]
		z_priority = 1}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = mb_helper_container
		Id = mb_random_image
		texture = band_name_graphic03
		rgba = [255 255 255 255]
		Pos = (($enter_band_name_big_vals).right_side_img_pos)
		Scale = (($enter_band_name_big_vals).right_side_img_scale)
		relative_scale
		z_priority = 2
	}
	<rand> = 0
	GetRandomValue \{Name = rand
		Integer
		A = 0
		B = 2}
	if (<rand> = 0)
		SetScreenElementProps \{Id = mb_random_image
			texture = band_name_graphic01}
	elseif (<rand> = 1)
		SetScreenElementProps \{Id = mb_random_image
			texture = band_name_graphic02}
	elseif (<rand> = 2)
		SetScreenElementProps \{Id = mb_random_image
			texture = band_name_graphic03}
	endif
	CreateScreenElement \{Type = SpriteElement
		PARENT = mb_helper_container
		Id = ticket_overlay
		texture = band_name_ticket_bar_overlay
		rgba = [
			255
			255
			255
			255
		]
		Pos = (734.0, 360.0)
		Dims = (684.0, 680.0)
		just = [
			Center
			Center
		]
		z_priority = 2}
	<manage_band_pos> = (725.0, 190.0)
	CreateScreenElement {
		Type = TextElement
		PARENT = mb_helper_container
		Pos = <manage_band_pos>
		font = text_a10_Large
		rgba = (($G_menu_colors).dk_violet_grey)
		Text = "MANAGE BAND"
		Scale = 1.75
		z_priority = 3
		Rot_Angle = -2
	}
	fit_text_in_rectangle Id = <Id> Dims = (850.0, 200.0) Pos = <manage_band_pos>
	CreateScreenElement {
		Type = TextElement
		PARENT = mb_helper_container
		Pos = (<manage_band_pos> + (0.0, 110.0))
		font = ($choose_band_menu_font)
		rgba = (($G_menu_colors).pink)
		Text = <the_bands_name>
		Scale = (1.75, 1.25)
		z_priority = 3
		Rot_Angle = -2
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 600)
		fit_text_in_rectangle Id = <Id> Dims = (1000.0, 70.0) Pos = (<manage_band_pos> + (0.0, 110.0))
	endif
	<mb_hlBar_pos_1> = (408.0, 385.0)
	<mb_hlBar_pos_2> = (408.0, 441.0)
	<mb_hlBar_dims> = (650.0, 58.0)
	CreateScreenElement {
		Type = SpriteElement
		Id = mb_hlBarID
		PARENT = mb_helper_container
		texture = White
		rgba = (($G_menu_colors).pink)
		just = [Top LEFT]
		Pos = <mb_hlBar_pos_1>
		Dims = <mb_hlBar_dims>
		z_priority = 3
		Rot_Angle = -2
		Alpha = 0.8
	}
	CreateScreenElement {
		Id = mb_rename_band_id
		PARENT = mb_menu_container
		Type = TextElement
		font = ($choose_band_menu_font)
		rgba = ($menu_unfocus_color)
		Text = "RENAME  BAND"
		just = [Center Top]
	}
	CreateScreenElement {
		PARENT = mb_vmenu
		Type = TextElement
		font = ($choose_band_menu_font)
		Text = ""
		Scale = 1.3
		just = [Center Top]
		event_handlers = [
			{Focus SetScreenElementProps Params = {
					Id = mb_hlBarID
					Pos = <mb_hlBar_pos_1>
				}
			}
			{Focus manage_band_highlighter Params = {Id = mb_rename_band_id SELECT}}
			{unfocus manage_band_highlighter Params = {Id = mb_rename_band_id unselect}}
			{pad_choose menu_manage_band_rename_band}
		]
	}
	CreateScreenElement {
		Id = mb_delete_band_id
		PARENT = mb_menu_container
		Type = TextElement
		font = ($choose_band_menu_font)
		rgba = (($G_menu_colors).dk_violet_grey)
		Text = "DELETE  BAND"
		just = [Center Top]
		Pos = (0.0, 56.0)
	}
	CreateScreenElement {
		PARENT = mb_vmenu
		Type = TextElement
		font = ($choose_band_menu_font)
		Text = ""
		just = [Center Top]
		event_handlers = [
			{Focus SetScreenElementProps Params = {
					Id = mb_hlBarID
					Pos = <mb_hlBar_pos_2>
				}
			}
			{Focus manage_band_highlighter Params = {Id = mb_delete_band_id SELECT}}
			{unfocus manage_band_highlighter Params = {Id = mb_delete_band_id unselect}}
			{pad_choose menu_manage_band_delete_band}
		]
	}
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

script manage_band_highlighter 
	GetScreenElementProps Id = <Id>
	if GotParam \{SELECT}
		SetScreenElementProps Id = <Id> rgba = (($G_menu_colors).lt_violet_grey) Pos = (<Pos> + (0.0, -8.0))
		DoScreenElementMorph Id = <Id> Scale = 1.3 Time = 0.2 Motion = ease_out
		GetScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((450.0, 0.0) + ((0.0, 1.0) * <Height>)) start_x_scale = 1.3 start_y_scale = 1.3 only_if_larger_x = 1
	elseif GotParam \{unselect}
		SetScreenElementProps Id = <Id> rgba = (($G_menu_colors).dk_violet_grey) Pos = (<Pos> + (0.0, 8.0))
		DoScreenElementMorph Id = <Id> Scale = 1.0 Time = 0.2 Motion = ease_out
		GetScreenElementDims Id = <Id>
		if (<width> > 634)
			fit_text_in_rectangle Id = <Id> Dims = ((626.0, 0.0) + ((0.0, 1.0) * <Height>)) start_x_scale = 1.0 start_y_scale = 1.0
		endif
	endif
endscript

script destroy_manage_band_menu 
	destroy_menu \{menu_id = mb_scroll}
	destroy_menu \{menu_id = mb_helper_container}
	destroy_menu \{menu_id = mb_menu_container}
	destroy_menu_backdrop
	clean_up_user_control_helpers
endscript

script menu_manage_band_rename_band 
	ui_flow_manager_respond_to_action \{action = select_rename_band}
endscript

script menu_manage_band_delete_band 
	ui_flow_manager_respond_to_action \{action = select_delete_band}
endscript
