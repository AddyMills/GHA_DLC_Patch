popup_warning_menu_font = fontgrid_title_gh3
popup_event_handlers_options = [
	{
		pad_up
		generic_menu_up_or_down_sound
		Params = {
			UP
		}
	}
	{
		pad_down
		generic_menu_up_or_down_sound
		Params = {
			DOWN
		}
	}
]
popup_event_handlers_nooptions = [
]
g_cpw_have_helper_pills = 0

script create_popup_warning_menu player_device = ($primary_controller)
	PrintStruct <...>
	Change \{g_cpw_have_helper_pills = 0}
	<Menu_pos> = (640.0, 510.0)
	<menu_bg_offset> = (0.0, -28.0)
	<event_handlers> = {}
	if GotParam \{options}
		GetArraySize <options>
		if (<array_Size> > 1)
			<event_handlers> = ($popup_event_handlers_options)
			<Menu_pos> = (642.0, 496.0)
			<menu_bg_offset> = (-2.0, -8.0)
		endif
	endif
	if (<player_device> = -1)
		exclusive_mp_controllers = [0 , 0]
		SetArrayElement ArrayName = exclusive_mp_controllers Index = 0 NewValue = ($player1_device)
		SetArrayElement ArrayName = exclusive_mp_controllers Index = 1 NewValue = ($player2_device)
		<player_device> = <exclusive_mp_controllers>
	endif
	new_menu {
		scrollid = pu_warning_scroll
		vmenuid = pu_warning_vmenu
		Menu_pos = <Menu_pos>
		Spacing = -45
		internal_just = [Center Center]
		event_handlers = <event_handlers>
		exclusive_device = <player_device>
		focus_color = pink
		unfocus_color = dk_violet_grey
	}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = popup_warning_container
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]}
	if NOT (GotParam no_background)
		displaySprite \{PARENT = popup_warning_container
			tex = Venue_BG
			Pos = (640.0, 360.0)
			Dims = (1280.0, 720.0)
			just = [
				Center
				Center
			]
			Z = 96}
		popup_warning_container :SetTags \{no_background = 0}
	else
		popup_warning_container :SetTags \{no_background = 1}
	endif
	offwhite = [223 223 223 255]
	Z = 100
	displaySprite PARENT = popup_warning_container tex = Dialog_Title_BG flip_v Pos = (416.0, 100.0) Dims = (224.0, 224.0) Z = <Z>
	displaySprite PARENT = popup_warning_container tex = Dialog_Title_BG Pos = (640.0, 100.0) Dims = (224.0, 224.0) Z = <Z>
	if GotParam \{options}
		CreateScreenElement {
			Type = VMenu
			PARENT = popup_warning_container
			Id = options_bg_id
			Pos = (<Menu_pos> + <menu_bg_offset>)
			just = [Center Top]
			internal_just = [Center Center]
		}
		displaySprite PARENT = options_bg_id tex = Dialog_BG Z = <Z>
		displaySprite PARENT = options_bg_id tex = Dialog_BG flip_h Z = <Z>
	endif
	create_pause_menu_frame Z = (<Z> - 4)
	create_popup_warning_text <...>
	if GotParam \{options}
		create_popup_warning_menu_options <...>
	endif
	if GotParam \{helper_pills}
		Change \{g_cpw_have_helper_pills = 1}
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
		GetArraySize <helper_pills>
		<I> = 0
		begin
		if (<helper_pills> [<I>] = SELECT)
			add_user_control_helper \{Text = "SELECT"
				button = Green
				Z = 100}
		elseif (<helper_pills> [<I>] = Back)
			add_user_control_helper \{Text = "BACK"
				button = RED
				Z = 100}
		elseif (<helper_pills> [<I>] = UPDOWN)
			add_user_control_helper \{Text = "UP/DOWN"
				button = Strumbar
				Z = 100}
		endif
		<I> = (<I> + 1)
		repeat <array_Size>
	endif
endscript

script destroy_popup_warning_menu 
	destroy_pause_menu_frame
	if ScreenElementExists \{Id = popup_warning_container}
		popup_warning_container :GetTags
		if (<no_background> = 0)
			destroy_menu_backdrop
		endif
	endif
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	if ($g_cpw_have_helper_pills = 1)
		clean_up_user_control_helpers
	endif
endscript

script create_popup_warning_text \{Title = "WARNING"}
	<title_scale> = 1.2
	if GotParam \{title_props}
		title_scale = (<title_props>.Scale)
	endif
	CreateScreenElement {
		Type = TextElement
		font = ($popup_warning_menu_font)
		Text = <Title>
		just = [Center Center]
		Pos = (640.0, 217.0)
		Scale = <title_scale>
		PARENT = popup_warning_container
		rgba = [200 200 200 255]
		Shadow
		shadow_offs = (4.0, 4.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<Z> + 2)
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = (280 * (1.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 only_if_larger_y = 0 start_x_scale = <title_scale> start_y_scale = <title_scale>
	if GotParam \{textblock}
		CreateScreenElement {
			Type = TextBlockElement
			font = ($popup_warning_menu_font)
			just = [Center Center]
			Pos = (640.0, 375.0)
			Dims = (700.0, 400.0)
			Scale = 0.6
			PARENT = popup_warning_container
			rgba = (($G_menu_colors).light_brown)
			Shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [0 0 0 255]
			z_priority = (<Z> + 2)
			<textblock>
		}
	endif
	if GotParam \{TextElement}
		CreateScreenElement {
			Type = TextElement
			font = ($popup_warning_menu_font)
			just = [Center Center]
			Pos = (640.0, 430.0)
			Scale = 0.85
			PARENT = popup_warning_container
			rgba = (($G_menu_colors).light_brown)
			Shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [0 0 0 255]
			z_priority = (<Z> + 2)
			<TextElement>
		}
	endif
endscript

script create_popup_warning_menu_option \{max_option_width = 300}
	<focus_params> = {use_highlight = 1}
	if GotParam \{pad_back_script}
		event_handlers = [
			{Focus menu_popup_focus Params = <focus_params>}
			{unfocus menu_popup_unfocus Params = <focus_params>}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_choose (<option>.func) Params = (<option>.Params)}
			{pad_back SoundEvent Params = {Event = Generic_Menu_Back_SFX}}
			{pad_back <pad_back_script>}
		]
	else
		event_handlers = [
			{Focus menu_popup_focus Params = <focus_params>}
			{unfocus menu_popup_unfocus Params = <focus_params>}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_choose (<option>.func) Params = (<option>.Params)}
		]
	endif
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <PARENT>
		Dims = (0.0, 90.0)
		event_handlers = <event_handlers>
	}
	<container_id> = <Id>
	CreateScreenElement {
		Type = HMenu
		PARENT = <container_id>
		internal_just = [Center Top]
		just = [Center Center]
	}
	<spacer_id> = <Id>
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <spacer_id>
		local_id = hi_left_spacer
		Dims = (64.0, 64.0)
	}
	CreateScreenElement {
		Type = SpriteElement
		local_id = hi_left
		PARENT = <Id>
		texture = Dialog_Highlight
		rgba = (($G_menu_colors).pink)
		Pos = (58.0, 7.0)
		just = [RIGHT Top]
		z_priority = (<Z> + 0.3)
		Alpha = 0
		flip_v
	}
	CreateScreenElement {
		Type = TextElement
		font = ($popup_warning_menu_font)
		PARENT = <spacer_id>
		local_id = Text
		rgba = ($menu_unfocus_color)
		font_spacing = 0
		just = [Center Center]
		z_priority = (<Z> + 1)
		(<option>)
	}
	GetScreenElementDims Id = <Id>
	if GotParam \{max_option_width}
		fit_text_in_rectangle Id = <Id> Dims = (<max_option_width> * (1.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1
	endif
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <spacer_id>
		local_id = hi_right_spacer
		Dims = (64.0, 64.0)
	}
	CreateScreenElement {
		Type = SpriteElement
		local_id = hi_right
		PARENT = <Id>
		texture = Dialog_Highlight
		rgba = (($G_menu_colors).pink)
		Pos = (0.0, 7.0)
		just = [LEFT Top]
		z_priority = (<Z> + 1)
		Alpha = 0
	}
	SetScreenElementLock Id = <spacer_id> ON
	SetScreenElementLock Id = <container_id> ON
endscript

script create_popup_warning_menu_options 
	<PARENT> = pu_warning_vmenu
	GetArraySize <options>
	<I> = 0
	begin
	if GotParam \{pad_back_script}
		create_popup_warning_menu_option {
			option = (<options> [<I>])
			Z = <Z>
			num_options = <array_Size>
			PARENT = <PARENT>
			max_option_width = <max_option_width>
			pad_back_script = <pad_back_script>
		}
	else
		create_popup_warning_menu_option {
			option = (<options> [<I>])
			Z = <Z>
			num_options = <array_Size>
			PARENT = <PARENT>
			max_option_width = <max_option_width>
		}
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
	<largest_width> = 0
	GetScreenElementChildren \{Id = pu_warning_vmenu}
	GetArraySize <children>
	<I> = 0
	begin
	GetScreenElementDims Id = {(<children> [<I>]) child = 0}
	if (<largest_width> < <width>)
		<largest_width> = <width>
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
	GetScreenElementChildren \{Id = options_bg_id}
	GetArraySize <children>
	<I> = 0
	begin
	GetScreenElementDims Id = (<children> [<I>])
	SetScreenElementProps Id = (<children> [<I>]) Dims = (<largest_width> * (1.0, 0.0) + <Height> * (0.0, 1.0) + (44.0, 0.0)) preserve_flip
	<I> = (<I> + 1)
	repeat <array_Size>
endscript

script menu_popup_focus 
	GetSingleTag \{Id}
	ResolveScreenElementID Id = {<Id> child = {0 child = Text}}
	retail_menu_focus Id = <resolved_id>
	if (<use_highlight> = 1)
		DoScreenElementMorph Id = {<Id> child = {0 child = {hi_right_spacer child = 0}}} Alpha = 1
		DoScreenElementMorph Id = {<Id> child = {0 child = {hi_left_spacer child = 0}}} Alpha = 1
	endif
endscript

script menu_popup_unfocus 
	GetSingleTag \{Id}
	ResolveScreenElementID Id = {<Id> child = {0 child = Text}}
	retail_menu_unfocus Id = <resolved_id>
	if (<use_highlight> = 1)
		DoScreenElementMorph Id = {<Id> child = {0 child = {hi_right_spacer child = 0}}} Alpha = 0
		DoScreenElementMorph Id = {<Id> child = {0 child = {hi_left_spacer child = 0}}} Alpha = 0
	endif
endscript
