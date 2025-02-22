new_band_name = [
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
]
new_band_flashing_char = "A"
new_band_flashing_index = 0
new_band_flashing_index_prev = 0
new_band_index = 0
max_band_characters = 19
ebn_using_big_vals = 1
ebn_transitioning_back = 0
ebn_reached_max_chars = 0
default_band_characters = [
	"A"
	"B"
	"C"
	"D"
	"E"
	"F"
	"G"
	"H"
	"I"
	"J"
	"K"
	"L"
	"M"
	"N"
	"O"
	"P"
	"Q"
	"R"
	"S"
	"T"
	"U"
	"V"
	"W"
	"X"
	"Y"
	"Z"
	"1"
	"2"
	"3"
	"4"
	"5"
	"6"
	"7"
	"8"
	"9"
	"0"
	"!"
	"@"
	"#"
	"$"
	"^"
	"&"
	"*"
	"("
	")"
	"_"
	"+"
	"-"
	"="
	"/"
	" "
]
band_name_position = (725.0, 345.0)
default_band_indexes = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
enter_band_name_big_vals = {
	top_title_scale = 1.2
	top_title_pos = (720.0, 115.0)
	text_scale = 2.0
	text_pos = (685.0, 290.0)
	background_pos = (640.0, 360.0)
	background_scale = (1.25, 1.4)
	header_pos = (725.0, 170.0)
	header_scale = 1.0
	tour_pos = (625.0, 410.0)
	tour_scale = 1.0
	address_pos = (625.0, 445.0)
	address_scale = 1.0
	date_pos = (740.0, 560.0)
	date_scale = 0.85
	sponsor_pos = (925.0, 402.0)
	sponsor_scale = 0.7
	sponsor_dims = (128.0, 128.0)
	sponsor_offset = (0.0, 20.0)
	right_side_img_pos = (1150.0, 345.0)
	right_side_img_scale = (2.05, 2.05)
}
enter_band_name_small_vals = {
	top_title_scale = 1.5
	top_title_pos = (645.0, 55.0)
	text_scale = 1.8
	text_diff = 0.071
	text_pos = (625.0, 260.0)
	background_pos = (540.0, 360.0)
	background_scale = (1.56, 1.76)
	header_pos = (652.0, 125.0)
	header_scale = 1.3
	tour_pos = (500.0, 425.0)
	tour_scale = 1.375
	address_pos = (500.0, 480.0)
	address_scale = 1.375
	date_pos = (670.0, 600.0)
	date_scale = 1.1
	sponsor_pos = (900.0, 410.0)
	sponsor_scale = 1.0
	sponsor_dims = (164.0, 164.0)
	sponsor_offset = (0.0, 26.0)
	right_side_img_pos = (1177.0, 343.0)
	right_side_img_scale = (2.6, 2.6)
}
us_month_names = [
	"January"
	"February"
	"March"
	"April"
	"May"
	"June"
	"July"
	"August"
	"September"
	"October"
	"November"
	"December"
]

script create_enter_band_name_menu 
	Change \{ebn_reached_max_chars = 0}
	SetScreenElementProps \{Id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		Replace_Handlers}
	NetSessionFunc \{func = stats_init}
	enter_band_name_reset_variables
	rotation_angle = -2
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = ebn_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		PARENT = ebn_container
		Id = ebn_menu_backdrop
		texture = Venue_BG
		rgba = [
			255
			255
			255
			255
		]
		Pos = (640.0, 360.0)
		Scale = (1.25, 1.4)
		relative_scale
		just = [
			Center
			Center
		]
		z_priority = 0}
	CreateScreenElement \{Type = SpriteElement
		PARENT = ebn_container
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
		PARENT = ebn_container
		Id = ticket_image
		texture = band_name_ticket
		rgba = [
			255
			255
			255
			255
		]
		Pos = (640.0, 360.0)
		Scale = (1.25, 1.4)
		relative_scale
		just = [
			Center
			Center
		]
		z_priority = 1}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = ebn_container
		Id = random_image
		texture = band_name_graphic03
		rgba = [255 255 255 200]
		Pos = (($enter_band_name_big_vals).right_side_img_pos)
		Scale = (($enter_band_name_big_vals).right_side_img_scale)
		relative_scale
		z_priority = 2
	}
	rand = 0
	GetRandomValue \{Name = rand
		Integer
		A = 0
		B = 2}
	if (<rand> = 0)
		SetScreenElementProps \{Id = random_image
			texture = band_name_graphic01}
	elseif (<rand> = 1)
		SetScreenElementProps \{Id = random_image
			texture = band_name_graphic02}
	elseif (<rand> = 2)
		SetScreenElementProps \{Id = random_image
			texture = band_name_graphic03}
	endif
	BLACK = [70 10 10 255]
	BLUE = [30 110 150 255]
	nameColor = [95 112 147 255]
	activeColor = (($G_menu_colors).pink)
	CreateScreenElement {
		Type = TextElement
		PARENT = ebn_container
		font = text_a3
		Text = "ENTER BAND NAME:"
		Id = ebn_header_text
		Pos = (($enter_band_name_big_vals).header_pos)
		Rot_Angle = <rotation_angle>
		rgba = (($G_menu_colors).dk_violet_grey)
		just = [Center Top]
		Scale = (($enter_band_name_big_vals).header_scale)
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = ebn_container
		font = text_a3
		Text = "AEROSMITH LEGENDS TOUR"
		Id = top_title_text
		Pos = (($enter_band_name_big_vals).top_title_pos)
		Rot_Angle = <rotation_angle>
		rgba = [212 228 236 255]
		just = [Center Top]
		Scale = (($enter_band_name_big_vals).top_title_scale)
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [142 134 160 255]
	}
	GetLocalSystemTime
	if English
		GetUpperCaseString (($us_month_names) [(<LocalSystemTime>.month)])
		FormatText TextName = date_text "%m %d, %y" M = (<UpperCaseString>) D = (<LocalSystemTime>.dayofmonth) Y = (<LocalSystemTime>.year)
	else
		GetUpperCaseString (($us_month_names) [(<LocalSystemTime>.month)])
		FormatText TextName = date_text "%d %m %y" D = (<LocalSystemTime>.dayofmonth) M = (<UpperCaseString>) Y = (<LocalSystemTime>.year)
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = ebn_container
		font = text_a3
		Text = <date_text>
		Id = ebn_date_text
		Pos = (($enter_band_name_big_vals).date_pos)
		Rot_Angle = <rotation_angle>
		rgba = <BLACK>
		just = [Center Top]
		Scale = (($enter_band_name_big_vals).date_scale)
	}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = ebn_container
		Id = band_name_text_container
		Rot_Angle = <rotation_angle>
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = band_name_text_container
		font = text_a3
		Scale = (($enter_band_name_big_vals).text_scale)
		rgba = <nameColor>
		Id = band_name_text
		Pos = (($enter_band_name_big_vals).text_pos)
		just = [Center Center]
		font_spacing = 2
	}
	CreateScreenElement {
		Type = TextElement
		Id = entry_character
		PARENT = band_name_text_container
		font = text_a3
		Scale = (($enter_band_name_big_vals).text_scale)
		rgba = <activeColor>
		Text = "A"
		Id = band_name_entry_char
		just = [Center Center]
	}
	RunScriptOnScreenElement Id = <Id> character_blinker
	CreateScreenElement {
		Type = SpriteElement
		PARENT = band_name_text_container
		Id = ebn_marker
		texture = band_name_underline
		just = [Center Center]
		event_handlers = [
			{pad_up enter_band_name_change_character Params = {UP}}
			{pad_down enter_band_name_change_character Params = {DOWN}}
			{pad_choose band_advance_pointer}
			{pad_back band_retreat_pointer}
			{pad_start confirm_band_name}
		]
		rgba = <activeColor>
		exclusive_device = ($primary_controller)
		Alpha = 0.6
	}
	LaunchEvent \{Type = Focus
		Target = ebn_marker}
	Change \{ebn_transitioning_back = 0}
	menu_ebn_update_marker
	enter_band_name_reset_user_control_helpers
endscript

script character_blinker 
	begin
	DoMorph \{Alpha = 0.2
		Motion = ease_in
		Time = 0.05}
	Wait \{0.05
		Seconds}
	DoMorph \{Alpha = 0.5
		Motion = ease_out
		Time = 0.05}
	Wait \{0.05
		Seconds}
	DoMorph \{Alpha = 0.2
		Motion = ease_in
		Time = 0.05}
	Wait \{0.05
		Seconds}
	DoMorph \{Alpha = 0.6
		Motion = ease_out
		Time = 0.2}
	Wait \{0.2
		Seconds}
	repeat
endscript

script enter_band_name_reset_user_control_helpers 
	add_user_control_helper \{button = Green
		Text = "NEXT"}
	add_user_control_helper \{button = RED
		Text = "BACK"}
	add_user_control_helper \{button = Strumbar
		Text = "UP/DOWN"}
	add_user_control_helper \{button = Start
		Text = "ACCEPT"}
endscript

script enter_band_name_reset_variables 
	Change \{new_band_name = [
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
		]}
	Change \{new_band_index = 0}
	Change \{default_band_indexes = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]}
	Change \{new_band_flashing_char = "A"}
	Change \{new_band_flashing_index = 0}
	Change \{new_band_flashing_index_prev = 0}
	Change \{new_band_index = 0}
	Change \{ebn_reached_max_chars = 0}
endscript

script destroy_enter_band_name_menu 
	destroy_menu \{menu_id = ebn_container}
	destroy_menu_backdrop
	clean_up_user_control_helpers
endscript

script blinker 
	if NOT ScreenElementExists Id = <Id>
		return
	endif
	begin
	DoScreenElementMorph Id = <Id> Alpha = 0 Time = <Time>
	Wait <Time> Seconds
	DoScreenElementMorph Id = <Id> Alpha = 1.0
	Wait <Time> Seconds
	repeat
endscript

script confirm_band_name 
	if ($ebn_transitioning_back)
		return
	endif
	num_spaces = 0
	array_entry = 0
	<valid> = 0
	<need_unique> = 0
	begin
	if NOT ($new_band_name [<array_entry>] = "")
		if NOT ($new_band_name [<array_entry>] = " ")
			<valid> = 1
			break
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat ($max_band_characters)
	if (<valid> = 1)
		<prev_band_index> = ($current_band - 1)
		if (<prev_band_index> > 0)
			begin
			menu_ebn_get_band_name_text
			StringRemoveTrailingWhitespace String = <band_name_text_string>
			get_band_game_mode_name
			FormatText ChecksumName = bandname_id 'band%i_info_%g' I = <prev_band_index> G = <game_mode_name>
			GetGlobalTags <bandname_id> Param = Name
			if (<Name> = <new_string>)
				<valid> = 0
				<need_unique> = 1
			endif
			<prev_band_index> = (<prev_band_index> - 1)
			repeat ($current_band - 1)
		endif
		<next_band_index> = ($current_band + 1)
		if (<next_band_index> < 6)
			begin
			menu_ebn_get_band_name_text
			StringRemoveTrailingWhitespace String = <band_name_text_string>
			get_band_game_mode_name
			FormatText ChecksumName = bandname_id 'band%i_info_%g' I = <next_band_index> G = <game_mode_name>
			GetGlobalTags <bandname_id> Param = Name
			if (<Name> = <new_string>)
				<valid> = 0
				<need_unique> = 1
			endif
			<next_band_index> = (<next_band_index> + 1)
			repeat (5 - $current_band)
		endif
	endif
	if (<valid> = 0)
		SoundEvent \{Event = Menu_Warning_SFX}
		enter_band_name_reset_variables
		menu_ebn_refresh_band_name
		menu_ebn_update_marker
		if ScreenElementExists \{Id = ebn_marker}
			if (<need_unique> = 1)
				create_alert_popup \{prev_menu_id = ebn_marker
					alert = "The Band Name you entered already exists.  Please enter a different Band Name."}
			else
				create_alert_popup \{prev_menu_id = ebn_marker
					alert = "You must enter a Band Name to proceed!"}
			endif
		endif
	else
		menu_ebn_get_band_name_text
		StringRemoveTrailingWhitespace String = <band_name_text_string>
		get_band_game_mode_name
		FormatText ChecksumName = bandname_id 'band%i_info_%g' I = ($current_band) G = <game_mode_name>
		GetTrueStartTime
		FormatText ChecksumName = band_unique_id 'band%i_info_%g_%d' I = ($current_band) G = <game_mode_name> D = <StartTime>
		SetGlobalTags <bandname_id> Params = {Name = <new_string> band_unique_id = <band_unique_id>}
		agora_update band_id = <band_unique_id> Name = <new_string> new_band
		if ($options_for_manage_band = 1)
			ui_flow_manager_respond_to_action \{action = enter_band_name_for_manage_band}
		else
			ui_flow_manager_respond_to_action \{action = enter_band_name}
		endif
	endif
endscript

script enter_band_name_change_character 
	if ($ebn_reached_max_chars = 1)
		return
	endif
	if GotParam \{device_num}
		if IsGuitarController controller = <device_num>
			if GotParam \{UP}
				change_character_down
			else
				change_character_up
			endif
		else
			if GotParam \{UP}
				change_character_up
			else
				change_character_down
			endif
		endif
	endif
endscript

script enter_band_name_remove_focus 
	LaunchEvent \{Type = unfocus
		Target = scrolling_enter_band_name}
endscript

script enter_band_name_refocus 
	LaunchEvent \{Type = Focus
		Target = scrolling_enter_band_name}
endscript

script change_character_up 
	generic_menu_up_or_down_sound \{UP}
	Change new_band_flashing_index = ($new_band_flashing_index + 1)
	GetArraySize \{$default_band_characters}
	if ($new_band_flashing_index > (<array_Size> -1))
		Change \{new_band_flashing_index = 0}
	endif
	Change new_band_flashing_char = ($default_band_characters [$new_band_flashing_index])
	menu_ebn_update_marker
endscript

script change_character_down 
	generic_menu_up_or_down_sound \{DOWN}
	Change new_band_flashing_index = ($new_band_flashing_index -1)
	if ($new_band_flashing_index < 0)
		GetArraySize \{$default_band_characters}
		Change new_band_flashing_index = (<array_Size> -1)
	endif
	Change new_band_flashing_char = ($default_band_characters [$new_band_flashing_index])
	menu_ebn_update_marker
endscript

script band_advance_pointer 
	if (($new_band_index + 1) < $max_band_characters)
		SoundEvent \{Event = ui_sfx_select}
		SetArrayElement \{ArrayName = new_band_name
			GlobalArray
			Index = $new_band_index
			NewValue = $new_band_flashing_char}
		Change \{new_band_flashing_index_prev = $new_band_flashing_index}
		Change new_band_index = ($new_band_index + 1)
		if ($new_band_index > 8)
			Change StructureName = enter_band_name_small_vals text_scale = ($enter_band_name_small_vals.text_scale - $enter_band_name_small_vals.text_diff)
			if ($enter_band_name_small_vals.text_scale < 1.2)
				Change \{StructureName = enter_band_name_small_vals
					text_scale = 1.2}
			endif
		endif
		menu_ebn_refresh_band_name
		if (($new_band_index + 1) = $max_band_characters)
			ebn_take_away_blinker
			GetScreenElementDims \{Id = band_name_entry_char}
			<char_width> = (<width> / 2)
			SetScreenElementProps Id = band_name_text Pos = (($enter_band_name_small_vals.text_pos) + (<char_width> * (1.0, 0.0)))
		endif
	endif
endscript

script ebn_take_away_blinker 
	clean_up_user_control_helpers
	add_user_control_helper \{button = RED
		Text = "BACK"}
	add_user_control_helper \{button = Start
		Text = "ACCEPT"}
	SetScreenElementProps \{Id = band_name_entry_char
		Hide}
	SetScreenElementProps \{Id = ebn_marker
		Hide}
	Change \{ebn_reached_max_chars = 1}
endscript

script band_retreat_pointer 
	if ($new_band_index = 0)
		Change \{ebn_transitioning_back = 1}
		ui_flow_manager_respond_to_action \{action = go_back}
		return
	endif
	if (($new_band_index -1) > -1)
		generic_menu_pad_back_sound
		Change new_band_index = ($new_band_index -1)
		if ($new_band_index > 8)
			Change StructureName = enter_band_name_small_vals text_scale = ($enter_band_name_small_vals.text_scale + $enter_band_name_small_vals.text_diff)
		endif
		Change new_band_flashing_char = ($new_band_name [$new_band_index])
		SetArrayElement \{ArrayName = new_band_name
			GlobalArray
			Index = $new_band_index
			NewValue = ""}
		Change \{new_band_flashing_index = $new_band_flashing_index_prev}
		if (($new_band_index + 2) = $max_band_characters)
			ebn_put_back_blinker
			Change \{StructureName = enter_band_name_small_vals
				text_scale = 1.2}
		endif
		menu_ebn_refresh_band_name
	endif
endscript

script ebn_put_back_blinker 
	clean_up_user_control_helpers
	enter_band_name_reset_user_control_helpers
	SetScreenElementProps \{Id = band_name_entry_char
		UnHide}
	SetScreenElementProps \{Id = ebn_marker
		UnHide}
	Change \{ebn_reached_max_chars = 0}
endscript

script menu_ebn_get_band_name_text 
	FormatText TextName = band_name_text_string "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p%q%r%s%t" A = ($new_band_name [0]) B = ($new_band_name [1]) C = ($new_band_name [2]) D = ($new_band_name [3]) E = ($new_band_name [4]) F = ($new_band_name [5]) G = ($new_band_name [6]) H = ($new_band_name [7]) I = ($new_band_name [8]) J = ($new_band_name [9]) K = ($new_band_name [10]) L = ($new_band_name [11]) M = ($new_band_name [12]) N = ($new_band_name [13]) O = ($new_band_name [14]) P = ($new_band_name [15]) Q = ($new_band_name [16]) R = ($new_band_name [17]) S = ($new_band_name [18]) T = ($new_band_name [19])
	return band_name_text_string = <band_name_text_string>
endscript
menu_ebn_width_threshold = 609
menu_ebn_backdrop_pos_change_factor = (100.0, 0.0)

script menu_ebn_refresh_band_name 
	menu_ebn_get_band_name_text
	<do_scaling> = 0
	if (($new_band_index = 9) && ($ebn_using_big_vals = 1))
		Change \{ebn_using_big_vals = 0}
		Change \{StructureName = enter_band_name_small_vals
			text_scale = 1.8}
		<vals_struct> = ($enter_band_name_small_vals)
		<do_scaling> = 1
	elseif (($new_band_index = 8) && ($ebn_using_big_vals = 0))
		Change \{ebn_using_big_vals = 1}
		<vals_struct> = ($enter_band_name_big_vals)
		<do_scaling> = 1
	elseif (($new_band_index = 0) && ($ebn_using_big_vals = 0))
		Change \{ebn_using_big_vals = 1}
		<vals_struct> = ($enter_band_name_big_vals)
		<do_scaling> = 1
	else
		<do_scaling> = 0
	endif
	if (($new_band_index > 8) && (<do_scaling> = 0))
		<vals_struct> = ($enter_band_name_small_vals)
		DoScreenElementMorph Id = band_name_text Scale = (<vals_struct>.text_scale) Pos = (<vals_struct>.text_pos) Time = <Time> Motion = ease_out
		DoScreenElementMorph Id = band_name_entry_char Scale = (<vals_struct>.text_scale) Time = <Time> Motion = ease_out
	endif
	SetScreenElementProps Id = band_name_text Text = (<band_name_text_string>)
	if (<do_scaling>)
		<Time> = 0.5
		LaunchEvent \{Type = unfocus
			Target = ebn_marker}
		DoScreenElementMorph Id = band_name_text Scale = (<vals_struct>.text_scale) Pos = (<vals_struct>.text_pos) Time = <Time> Motion = ease_out
		DoScreenElementMorph Id = band_name_entry_char Scale = (<vals_struct>.text_scale) Time = <Time> Motion = ease_out
		SetScreenElementProps \{Id = band_name_entry_char
			Hide}
		SetScreenElementProps \{Id = ebn_marker
			Hide}
		DoScreenElementMorph Id = ebn_menu_backdrop Pos = (<vals_struct>.background_pos) Scale = (<vals_struct>.background_scale) relative_scale Time = <Time> Motion = ease_out
		DoScreenElementMorph Id = ticket_image Pos = (<vals_struct>.background_pos) Scale = (<vals_struct>.background_scale) relative_scale Time = <Time> Motion = ease_out
		DoScreenElementMorph Id = ebn_header_text Pos = (<vals_struct>.header_pos) Scale = (<vals_struct>.header_scale) Time = <Time> Motion = ease_out
		DoScreenElementMorph Id = top_title_text Pos = (<vals_struct>.top_title_pos) Scale = (<vals_struct>.top_title_scale) Time = <Time> Motion = ease_out
		DoScreenElementMorph Id = ebn_date_text Pos = (<vals_struct>.date_pos) Scale = (<vals_struct>.date_scale) Time = <Time> Motion = ease_out
		DoScreenElementMorph Id = random_image Pos = ((<vals_struct>.right_side_img_pos)) Scale = (<vals_struct>.right_side_img_scale) relative_scale Time = <Time> Motion = ease_out
		Wait (<Time> * 1.5) Seconds
		menu_ebn_update_marker
		LaunchEvent \{Type = Focus
			Target = ebn_marker}
	else
		menu_ebn_update_marker
	endif
endscript

script menu_ebn_update_marker 
	vals_struct = ($enter_band_name_big_vals)
	if ($new_band_index > 8)
		<vals_struct> = ($enter_band_name_small_vals)
	endif
	SetScreenElementProps \{Id = band_name_entry_char
		Text = $new_band_flashing_char}
	GetScreenElementDims \{Id = band_name_entry_char}
	new_width = <width>
	new_height = <Height>
	fastscreenelementpos \{Id = band_name_text}
	GetScreenElementDims \{Id = band_name_text}
	new_pos = (<ScreenELementPos> + (1.0, 0.0) * 0.5 * <width> + (1.0, 0.0) * <new_width> * 0.5)
	SetScreenElementProps Id = band_name_entry_char Text = $new_band_flashing_char Pos = <new_pos> UnHide
	GetScreenElementDims \{Id = ebn_marker}
	SetScreenElementProps Id = ebn_marker Dims = ((1.0, 0.0) * <new_width> + (0.0, 1.0) * <Height>) Pos = (<new_pos> + (<new_height> * 0.4 * (0.0, 1.0))) UnHide
endscript
