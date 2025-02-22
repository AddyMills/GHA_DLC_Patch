gbh_first_time_in = 1
battle_explanation_bullet_materials = [
	sys_BattleGEM_Green01_sys_BattleGEM_Green01
	sys_BattleGEM_RED01_sys_BattleGEM_RED01
	sys_BattleGEM_Yellow01_sys_BattleGEM_Yellow01
	sys_BattleGEM_Blue01_sys_BattleGEM_Blue01
	sys_BattleGEM_Orange01_sys_BattleGEM_Orange01
]
battle_explanation_text = {
	bossjoe = {
		image = battle_help_boss_bg_JPerry
		Title = "JOE PERRY WANTS TO BATTLE!"
		bullets = [
			{
				Text = "Hit each series of BATTLE GEMS to collect ATTACKS"
			}
			{
				Text = "Once you have collected an ATTACK, Tilt your guitar upward to disrupt Joe and make him miss"
			}
			{
				Text = "You HAVE to make him FAIL before the end or else YOU LOSE"
			}
			{
				Text = "Be careful, he can battle back"
			}
		]
		prompt = "Ready to Rock?"
	}
	Generic = {
		Title = "BATTLE MODE!"
		bullets = [
			{
				Text = "Hit each series of BATTLE GEMS to collect ATTACKS"
			}
			{
				Text = "Once you have collected an ATTACK, Tilt your guitar upward to disrupt your opponent and make them miss"
			}
			{
				Text = "You HAVE to make your opponent FAIL before the end or else you go to SUDDEN DEATH"
			}
			{
				Text = "In SUDDEN DEATH all the ATTACKS become the devastating DEATH DRAIN"
			}
		]
		prompt = "Ready to Rock?"
	}
}

script create_battle_helper_menu \{device_num = 0
		Popup = 0}
	if GameIsPaused
		UnPauseGame
	endif
	<bg_texture> = battle_help_boss_bg_JPerry
	if GotParam \{boss}
		if ($game_mode = p2_battle)
			<boss_structure> = ($battle_explanation_text.Generic)
			<bg_texture> = battle_mode_BG
		else
			<boss_structure> = ($battle_explanation_text.<boss>)
		endif
	else
		GetGlobalTags \{Progression}
		<boss_structure> = ($battle_explanation_text.<boss_song>)
	endif
	menu_z = 10
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = battle_explanation_container}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = battle_explanation_container
		Id = battle_explanation_screen
		Pos = (640.0, 360.0)
		texture = <bg_texture>
		rgba = [223 223 223 255]
		just = [Center Center]
		Dims = (1280.0, 720.0)
		z_priority = 0
	}
	CreateScreenElement \{PARENT = battle_explanation_container
		Type = VMenu
		Id = bullet_spacer
		Pos = (545.0, 205.0)
		just = [
			LEFT
			Top
		]
		internal_just = [
			LEFT
			Top
		]}
	GetArraySize \{$battle_explanation_bullet_materials}
	<num_materials> = <array_Size>
	GetArraySize (<boss_structure>.bullets)
	<num_bullets> = <array_Size>
	<I> = 0
	begin
	CreateScreenElement \{PARENT = bullet_spacer
		Type = ContainerElement
		Dims = (100.0, 100.0)
		just = [
			LEFT
			Top
		]}
	<container_id> = <Id>
	CreateScreenElement {
		PARENT = <container_id>
		Type = TextBlockElement
		Text = (<boss_structure>.bullets [<I>].Text)
		local_id = Text
		Dims = (480.0, 0.0)
		Pos = (0.0, 0.0)
		allow_expansion
		rgba = (($G_menu_colors).lt_violet_grey)
		z_priority = 50
		line_spacing = 0.9
		font = text_a4
		just = [LEFT Top]
		internal_just = [LEFT Top]
		internal_scale = 0.625
		Shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
		Alpha = 0
	}
	GetScreenElementDims Id = <Id>
	<container_id> :SetProps Dims = ((1.0, 0.0) * <width> + (0.0, 1.0) * <Height> + (0.0, 20.0))
	Mod A = <I> B = <num_materials>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		rgba = [255 255 255 255]
		just = [RIGHT Top]
		z_priority = 40
		local_id = gem
		Pos = (12.0, 7.0)
		Scale = 0.5
		Material = ($battle_explanation_bullet_materials [<Mod>])
		Alpha = 0
		MaterialProps = [
			{
				Name = m_startFade
				Property = 1.0
			}
			{
				Name = m_endFade
				Property = 1.0
			}
			{
				Name = m_playerIndex
				Property = 1.0
			}
		]
	}
	RunScriptOnScreenElement Id = <container_id> battle_fly_in_anim Params = {idx = <I> container_id = <container_id>}
	<I> = (<I> + 1)
	repeat <num_bullets>
	if ISPS3
		Change \{gHighwayStartFade = 1.0}
		Change \{gHighwayEndFade = 1.0}
	endif
	if StructureContains \{Structure = boss_structure
			image}
		CreateScreenElement {
			Type = SpriteElement
			Id = who_wants_to_battle_image
			PARENT = battle_explanation_container
			rgba = [255 255 255 255]
			Pos = (640.0, 360.0)
			Dims = (1280.0, 720.0)
			texture = (<boss_structure>.image)
			just = [Center Center]
			z_priority = 5
			Alpha = 1
		}
	endif
	<title_offset> = (-10.0, -20.0)
	displaySprite {
		PARENT = battle_explanation_container
		tex = battle_help_flourish
		Pos = ((770.0, 165.0) + <title_offset>)
		Dims = (384.0, 96.0)
		just = [Center Bottom]
		Z = 50
	}
	<Id> :DoMorph Alpha = 0.5
	displaySprite {
		PARENT = battle_explanation_container
		tex = battle_help_flourish
		Pos = ((770.0, 145.0) + <title_offset>)
		just = [Center Top]
		Dims = (384.0, 96.0)
		Z = 50
		flip_h
	}
	<Id> :DoMorph Alpha = 0.5
	if ($game_mode = p2_faceoff ||
			$game_mode = p2_pro_faceoff ||
			$game_mode = p2_battle ||
			$game_mode = p2_quickplay)
		exclusive_mp_controllers = [0 , 0]
		SetArrayElement ArrayName = exclusive_mp_controllers Index = 0 NewValue = ($player1_device)
		SetArrayElement ArrayName = exclusive_mp_controllers Index = 1 NewValue = ($player2_device)
		exclusive_device = <exclusive_mp_controllers>
	else
		exclusive_device = ($primary_controller)
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = battle_explanation_container
		Id = who_wants_to_battle_text
		Text = (<boss_structure>.Title)
		font = text_a10
		Scale = 1
		Pos = ((770.0, 120.0) + <title_offset>)
		rgba = (($G_menu_colors).pink)
		just = [Center Top]
		z_priority = 51
		font_spacing = 5
		Shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
		event_handlers = [
			{pad_choose battle_helper_continue Params = {device_num = <device_num>}}
			{pad_back battle_helper_back}
		]
		exclusive_device = <exclusive_device>
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = ((530.0, 0.0) + (<Height> * (0.0, 1.0))) start_x_scale = 1 start_y_scale = 1 only_if_larger_x = 1
	CreateScreenElement {
		Type = TextElement
		PARENT = bullet_spacer
		Text = (<boss_structure>.prompt)
		font = text_a4
		Scale = 0.7
		Pos = (575.0, 580.0)
		rgba = (($G_menu_colors).BLACK)
		just = [LEFT Top]
		z_priority = 50
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = (($G_menu_colors).lt_violet_grey)
		Alpha = 0
	}
	RunScriptOnScreenElement Id = <Id> wait_and_show_ready
	if ($gbh_first_time_in = 0)
		LaunchEvent \{Type = Focus
			Target = who_wants_to_battle_text}
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
		add_user_control_helper \{Text = "BATTLE"
			button = Green
			Z = 100}
		add_user_control_helper \{Text = "DECLINE"
			button = RED
			Z = 100}
	endif
endscript

script battle_helper_continue 
	ui_flow_manager_respond_to_action action = Continue device_num = <device_num>
endscript

script battle_helper_back 
	if ($game_mode = p1_career)
		WriteAchievements \{Achievement = WUSS_OUT}
	endif
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script destroy_battle_helper_menu 
	if ($gbh_first_time_in = 1)
		Change \{gbh_first_time_in = 0}
	endif
	clean_up_user_control_helpers
	destroy_menu \{menu_id = battle_explanation_container}
endscript

script battle_fly_in_anim 
	ResolveScreenElementID Id = {<container_id> child = Text}
	<text_id> = <resolved_id>
	ResolveScreenElementID Id = {<container_id> child = gem}
	<gem_id> = <resolved_id>
	Wait \{0.15
		Seconds}
	Wait (<idx> * 2.25) Seconds
	<gem_id> :GetProps
	<gem_final_pos> = <Pos>
	SoundEvent \{Event = GH3_Star_FlyIn}
	<gem_id> :DoMorph Pos = (<gem_final_pos> + (-600.0, 0.0)) Alpha = 1
	<gem_id> :DoMorph Pos = <gem_final_pos> Time = 0.35000002 Motion = ease_in
	<text_id> :DoMorph Time = 0.2 Motion = ease_in rgba = [255 255 255 255] Alpha = 1
	<text_id> :DoMorph Time = 0.1 Motion = ease_out rgba = (($G_menu_colors).lt_violet_grey)
endscript

script wait_and_show_ready 
	<Time> = 9.8
	if ($gbh_first_time_in = 1)
		DoMorph \{Alpha = 0}
		Wait \{4
			Seconds}
		LaunchEvent \{Type = Focus
			Target = who_wants_to_battle_text}
		Wait (<Time> - 4.0) Seconds
		DoMorph \{Time = 0.2
			Motion = ease_in
			rgba = [
				255
				255
				255
				255
			]
			Alpha = 1}
		DoMorph Time = 0.1 Motion = ease_in rgba = (($G_menu_colors).BLACK)
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
		add_user_control_helper \{Text = "BATTLE"
			button = Green
			Z = 100}
		add_user_control_helper \{Text = "DECLINE"
			button = RED
			Z = 100}
	else
		Wait <Time> Seconds
		DoMorph \{Time = 0.2
			Motion = ease_in
			rgba = [
				255
				255
				255
				255
			]
			Alpha = 1}
		DoMorph Time = 0.1 Motion = ease_in rgba = (($G_menu_colors).BLACK)
	endif
endscript
