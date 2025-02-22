g_mqsm_created = 0
g_mqsm_do_flash = 1

script create_select_quickplay_mode 
	SpawnScriptNow \{Menu_Music_On}
	if ($g_mqsm_created)
		return
	endif
	Change \{g_mqsm_created = 1}
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = mqsm_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		PARENT = mqsm_container
		texture = Toprockers_poster
		Pos = (740.0, 30.0)
		just = [
			RIGHT
			Top
		]
		Dims = (620.0, 620.0)
		z_priority = 1.2
		Rot_Angle = -3}
	text_params = {Type = TextBlockElement line_spacing = 0.75 Dims = (420.0, 100.0) font = text_a6 just = [Center Center] Rot_Angle = -3}
	CreateScreenElement {
		<text_params>
		PARENT = mqsm_container
		Id = single_quickplay_text
		Text = "SINGLE QUICKPLAY"
		rgba = (($G_menu_colors).violet_focus)
		Pos = (432.0, 120.0)
		Scale = 1.0
	}
	CreateScreenElement {
		<text_params>
		PARENT = mqsm_container
		Id = coop_quickplay_text
		Text = "MULTIPLAYER CO-OP"
		rgba = (($G_menu_colors).brown_unfocus)
		Pos = (462.0, 593.0)
		Scale = 0.7
	}
	new_menu \{scrollid = scrolling_select_quickplay_mode
		vmenuid = vmenu_select_quickplay_mode
		Menu_pos = (640.0, 260.0)
		use_backdrop = 0
		exclusive_device = $primary_controller
		event_handlers = [
			{
				pad_back
				ui_flow_manager_respond_to_action
				Params = {
					action = go_back
				}
			}
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
		exclusive_device = $primary_controller}
	CreateScreenElement \{Type = ContainerElement
		PARENT = vmenu_select_quickplay_mode
		Dims = (100.0, 100.0)
		event_handlers = [
			{
				Focus
				mqsm_focus
				Params = {
					Id = single_quickplay_text
				}
			}
			{
				unfocus
				mqsm_unfocus
				Params = {
					Id = single_quickplay_text
				}
			}
			{
				pad_choose
				ui_flow_manager_respond_to_action
				Params = {
					action = select_p1_quickplay
				}
			}
		]
		exclusive_device = $primary_controller}
	CreateScreenElement \{Type = ContainerElement
		PARENT = vmenu_select_quickplay_mode
		Dims = (100.0, 100.0)
		event_handlers = [
			{
				Focus
				mqsm_focus
				Params = {
					Id = coop_quickplay_text
				}
			}
			{
				unfocus
				mqsm_unfocus
				Params = {
					Id = coop_quickplay_text
				}
			}
			{
				pad_choose
				ui_flow_manager_respond_to_action
				Params = {
					action = select_p2_quickplay
				}
			}
		]
		exclusive_device = $primary_controller}
	new_menu \{scrollid = scrolling_tr_select_difficulty_mode
		vmenuid = vmenu_tr_select_difficulty_mode
		Menu_pos = (710.0, 200.0)
		use_backdrop = 0
		exclusive_device = $primary_controller
		internal_just = [
			LEFT
			Center
		]
		event_handlers = [
			{
				pad_back
				mqsm_unfocus_difficulty_menu
			}
			{
				pad_back
				ui_flow_manager_respond_to_action
				Params = {
					action = go_back
				}
			}
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
		exclusive_device = $primary_controller}
	<I> = 0
	<bar_pos> = (850.0, 243.0)
	begin
	FormatText ChecksumName = bar_id 'bar_%i' I = <I>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = mqsm_container
		Id = <bar_id>
		texture = White
		rgba = (($G_menu_colors).dk_violet_bar)
		Alpha = 0.7
		Pos = <bar_pos>
		Dims = (300.0, 40.0)
		z_priority = 1.2
	}
	<bar_pos> = (<bar_pos> + (0.0, 48.0))
	<I> = (<I> + 1)
	repeat 4
	text_params = {Type = TextElement PARENT = vmenu_tr_select_difficulty_mode Scale = 1.0 font = text_a6 rgba = [150 150 150 100]}
	CreateScreenElement {
		<text_params>
		Id = easy_text
		Text = "EASY"
		event_handlers = [
			{Focus mqsm_diff_highlight Params = {Index = 0 diff = 'easy'}}
			{unfocus mqsm_diff_unhighlight Params = {Index = 0 diff = 'easy'}}
			{pad_choose mqsm_selected_difficulty Params = {diff = EASY}}
		]
		exclusive_device = $primary_controller
	}
	CreateScreenElement {
		<text_params>
		Id = medium_text
		Text = "MEDIUM"
		event_handlers = [
			{Focus mqsm_diff_highlight Params = {Index = 1 diff = 'medium'}}
			{unfocus mqsm_diff_unhighlight Params = {Index = 1 diff = 'medium'}}
			{pad_choose mqsm_selected_difficulty Params = {diff = MEDIUM}}
		]
		exclusive_device = $primary_controller
	}
	CreateScreenElement {
		<text_params>
		Id = hard_text
		Text = "HARD"
		event_handlers = [
			{Focus mqsm_diff_highlight Params = {Index = 2 diff = 'hard'}}
			{unfocus mqsm_diff_unhighlight Params = {Index = 2 diff = 'hard'}}
			{pad_choose mqsm_selected_difficulty Params = {diff = HARD}}
		]
		exclusive_device = $primary_controller
	}
	CreateScreenElement {
		<text_params>
		Id = expert_text
		Text = "EXPERT"
		event_handlers = [
			{Focus mqsm_diff_highlight Params = {Index = 3 diff = 'expert'}}
			{unfocus mqsm_diff_unhighlight Params = {Index = 3 diff = 'expert'}}
			{pad_choose mqsm_selected_difficulty Params = {diff = EXPERT}}
		]
		exclusive_device = $primary_controller
	}
	LaunchEvent \{Type = unfocus
		Target = vmenu_tr_select_difficulty_mode}
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

script mqsm_focus 
	if ($g_mqsm_do_flash)
		KillSpawnedScript \{Name = mqsm_focus_flash}
		SpawnScriptNow Id = <Id> mqsm_focus_flash Params = {Id = <Id>}
	else
		DoScreenElementMorph Id = <Id> rgba = (($G_menu_colors).lt_violet_bar) Scale = 1.0 Time = 0.15
	endif
endscript

script mqsm_focus_flash 
	<Time> = 0.15
	begin
	DoScreenElementMorph Id = <Id> rgba = (($G_menu_colors).lt_violet_bar) Scale = 1.0 Time = <Time> Motion = ease_out
	Wait <Time> Seconds
	DoScreenElementMorph Id = <Id> rgba = (($G_menu_colors).violet_focus) Scale = 0.9 Time = <Time> Motion = ease_in
	Wait <Time> Seconds
	repeat
endscript

script mqsm_unfocus 
	DoScreenElementMorph Id = <Id> rgba = (($G_menu_colors).brown_unfocus) Scale = 0.7 Time = 0.15
endscript

script mqsm_focus_difficulty_menu 
	LaunchEvent \{Type = unfocus
		Target = vmenu_select_quickplay_mode}
	if ($g_mqsm_do_flash)
		KillSpawnedScript \{Name = mqsm_focus_flash}
	endif
	if ($top_rockers_which_mode = p1_quickplay)
		DoScreenElementMorph Id = single_quickplay_text rgba = (($G_menu_colors).lt_violet_bar) Scale = 1.0 Time = 0.15
		DoScreenElementMorph \{Id = coop_quickplay_text
			Alpha = 0.6
			Time = 0.15}
	else
		DoScreenElementMorph Id = coop_quickplay_text rgba = (($G_menu_colors).lt_violet_bar) Scale = 1.0 Time = 0.15
		DoScreenElementMorph \{Id = single_quickplay_text
			Alpha = 0.6
			Time = 0.15}
	endif
	Change \{g_mqsm_created = 1}
	Time = 0.3
	<I> = 0
	begin
	FormatText ChecksumName = bar_id 'bar_%i' I = <I>
	DoScreenElementMorph Id = <bar_id> rgba = (($G_menu_colors).dk_violet_bar) Time = <Time>
	<I> = (<I> + 1)
	repeat 4
	DoScreenElementMorph Id = easy_text rgba = (($G_menu_colors).White) Time = <Time>
	DoScreenElementMorph Id = medium_text rgba = (($G_menu_colors).White) Time = <Time>
	DoScreenElementMorph Id = hard_text rgba = (($G_menu_colors).White) Time = <Time>
	DoScreenElementMorph Id = expert_text rgba = (($G_menu_colors).White) Time = <Time>
	LaunchEvent \{Type = Focus
		Target = vmenu_tr_select_difficulty_mode}
endscript

script mqsm_unfocus_difficulty_menu 
	if NOT ScreenElementExists \{Id = vmenu_tr_select_difficulty_mode}
		return
	endif
	LaunchEvent \{Type = unfocus
		Target = vmenu_tr_select_difficulty_mode}
	DoScreenElementMorph \{Id = single_quickplay_text
		Alpha = 1
		Time = 0.15}
	DoScreenElementMorph \{Id = coop_quickplay_text
		Alpha = 1
		Time = 0.15}
	Time = 0.3
	<I> = 0
	begin
	FormatText ChecksumName = bar_id 'bar_%i' I = <I>
	DoScreenElementMorph Id = <bar_id> rgba = (($G_menu_colors).dk_violet_bar) Time = <Time>
	<I> = (<I> + 1)
	repeat 4
	DoScreenElementMorph Id = easy_text rgba = (($G_menu_colors).grey150) Time = <Time> Alpha = 0.4
	DoScreenElementMorph Id = medium_text rgba = (($G_menu_colors).grey150) Time = <Time> Alpha = 0.4
	DoScreenElementMorph Id = hard_text rgba = (($G_menu_colors).grey150) Time = <Time> Alpha = 0.4
	DoScreenElementMorph Id = expert_text rgba = (($G_menu_colors).grey150) Time = <Time> Alpha = 0.4
	LaunchEvent \{Type = Focus
		Target = vmenu_select_quickplay_mode}
endscript

script mqsm_diff_highlight 
	Time = 0.2
	FormatText ChecksumName = bar_id 'bar_%i' I = <Index>
	FormatText ChecksumName = text_id '%d_text' D = <diff>
	DoScreenElementMorph Id = <bar_id> rgba = (($G_menu_colors).lt_violet_bar) Time = <Time>
	DoScreenElementMorph Id = <text_id> rgba = (($G_menu_colors).violet_focus) Time = <Time>
endscript

script mqsm_diff_unhighlight 
	Time = 0.2
	FormatText ChecksumName = bar_id 'bar_%i' I = <Index>
	FormatText ChecksumName = text_id '%d_text' D = <diff>
	DoScreenElementMorph Id = <bar_id> rgba = (($G_menu_colors).dk_violet_bar) Time = <Time>
	DoScreenElementMorph Id = <text_id> rgba = (($G_menu_colors).White) Time = <Time>
endscript

script mqsm_selected_difficulty 
	Change current_difficulty = <diff>
	ui_flow_manager_respond_to_action \{action = Continue}
endscript

script destroy_select_quickplay_mode 
	if ($g_mqsm_do_flash)
		KillSpawnedScript \{Name = mqsm_focus_flash}
	endif
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_select_quickplay_mode}
	destroy_menu_backdrop
	destroy_menu \{menu_id = mqsm_container}
	destroy_menu \{menu_id = scrolling_tr_select_difficulty_mode}
	Change \{g_mqsm_created = 0}
endscript
