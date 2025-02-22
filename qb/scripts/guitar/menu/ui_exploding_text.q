num_exploding_particles = 100
g_ui_exploding_text_top_pos = (640.0, 240.0)
g_ui_exploding_text_bottom_pos = (640.0, 380.0)
g_ui_exploding_text_top_height = 380

script create_exploding_text \{PARENT = 'you_rock_physics'
		Text = "You Rock!"
		placement = Top
		just = [
			Center
			Bottom
		]}
	FormatText ChecksumName = cont_id '%p' P = <PARENT>
	if ScreenElementExists Id = <cont_id>
		return
	endif
	if (<placement> = Top)
		cont_pos = $g_ui_exploding_text_top_pos
	else
		cont_pos = $g_ui_exploding_text_bottom_pos
	endif
	check_screen_for_physics
	if NOT ScreenElementExists \{Id = exploding_particle_container}
		create_exploding_particles
		<explode> = 1
	else
		<explode> = 0
	endif
	split_text_into_physics_array_elements {
		Id = YouRock_text
		PARENT = <PARENT>
		Text = <Text>
		text_pos = (0.0, 0.0)
		cont_pos = <cont_pos>
		space_between = (40.0, 0.0)
		fit_dims = (640.0, 120.0)
		just = <just>
		placement = <placement>
		flags = {
			Scale = 1.0
			z_priority = 95
			font = text_a10_Large
			rgba = [250 240 220 255]
			Alpha = 1
		}
		centered
	}
	do_text_slam {
		PARENT = <PARENT>
		explode = <explode>
		text_physics = 1
		exploding_text_array_size = <exploding_text_array_size>
		cont_pos = <cont_pos>
	}
endscript

script destroy_exploding_text \{PARENT = 'you_rock_physics'}
	FormatText ChecksumName = cont_id '%p' P = <PARENT>
	if ScreenElementExists Id = <cont_id>
		DestroyScreenElement Id = <cont_id>
	endif
	if ScreenElementExists \{Id = exploding_particle_container}
		DestroyScreenElement \{Id = exploding_particle_container}
	endif
endscript

script destroy_all_exploding_text 
	FormatText \{ChecksumName = cont_id_1
		'you_rock_physics'}
	FormatText \{ChecksumName = cont_id_2
		'you_rock_2_physics'}
	FormatText \{ChecksumName = cont_id_3
		'you_rock_legend_physics'}
	if ScreenElementExists Id = <cont_id_1>
		DestroyScreenElement Id = <cont_id_1>
	endif
	if ScreenElementExists Id = <cont_id_2>
		DestroyScreenElement Id = <cont_id_2>
	endif
	if ScreenElementExists Id = <cont_id_3>
		DestroyScreenElement Id = <cont_id_3>
	endif
	if ScreenElementExists \{Id = exploding_particle_container}
		DestroyScreenElement \{Id = exploding_particle_container}
	endif
endscript

script create_exploding_particles 
	CreateScreenElement \{Type = ContainerElement
		Id = exploding_particle_container
		PARENT = root_window
		Pos = (0.0, 0.0)}
	<I> = 0
	begin
	FormatText ChecksumName = particle_id 'particle_%i' I = <I>
	GetRandomValue \{A = 280.0
		B = 980.0
		Name = rand_x}
	GetRandomValue \{A = 200.0
		B = 400.0
		Name = rand_y}
	<random_color> = Random (@ [255 255 255 255] @ [200 100 100 255] @ [255 215 100 255] @ [255 250 200 255] @ [255 165 75 255] )
	<new_pos> = ((<rand_x> * (1.0, 0.0)) + (<rand_y> * (0.0, 1.0)))
	CreateScreenElement {
		Type = PhysicsElement
		Id = <particle_id>
		PARENT = exploding_particle_container
		Alpha = 0
		Pos = <new_pos>
		Mass = 125.0
		Center = (2.0, 2.0)
		Radius = 2.83
		elasticity = 0.75
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <particle_id>
		texture = particle_red_32
		rgba = <random_color>
		Dims = (5.0, 5.0)
		Pos = (0.0, 0.0)
		just = [LEFT Top]
		z_priority = 30
		BLEND = Add
	}
	<I> = (<I> + 1)
	repeat $num_exploding_particles
endscript

script do_text_slam \{Time = 1.0}
	<zoom_time_1> = 0.3
	<zoom_time_2> = 0.2
	<zoom_time_3> = 0.15
	<zoom_time_4> = 0.15
	<zoom_time_5> = 0.1
	<zoom_time_6> = 2.0
	<hiccup_time> = 0.1
	<scale_2> = 0.6
	<scale_3> = 0.9
	<scale_4> = 0.825
	<scale_5> = 0.85
	<scale_6> = 0.825
	<scale_7> = 1.0
	<hiccup_scale> = 1.025
	<orig_pos> = <cont_pos>
	<orig_alpha> = 0.25
	<orig_scale> = 2
	FormatText ChecksumName = cont_id '%p' P = <PARENT>
	GetScreenElementProps Id = <cont_id>
	<final_pos> = <Pos>
	<final_alpha> = 0.575
	SetScreenElementProps {
		Id = <cont_id>
		Pos = <orig_pos>
		Alpha = <orig_alpha>
		Scale = <orig_scale>
		relative_scale
	}
	<cont_id> :DoMorph {
		Pos = <final_pos>
		Alpha = <final_alpha>
		Scale = <scale_2>
		Time = <zoom_time_1>
		Motion = ease_in
	}
	<cont_id> :DoMorph {
		Scale = <scale_3>
		Time = <zoom_time_2>
		Motion = ease_out
	}
	<cont_id> :DoMorph {
		Scale = <scale_4>
		Time = <zoom_time_3>
		Motion = ease_in
	}
	<cont_id> :DoMorph {
		Scale = <scale_5>
		Time = <zoom_time_4>
		Motion = ease_out
	}
	<cont_id> :DoMorph {
		Scale = <scale_6>
		Time = <zoom_time_5>
		Motion = ease_in
	}
	Wait \{0.5
		Seconds}
	<cont_id> :DoMorph {
		Scale = <scale_7>
		Time = <zoom_time_6>
		Motion = smooth
		Alpha = 1.0
	}
	<cont_id> :DoMorph {
		Scale = <hiccup_scale>
		Time = <hiccup_time>
	}
	<cont_id> :DoMorph {
		Scale = <scale_7>
		Time = <hiccup_time>
	}
	if (<explode> = 1)
		CreateScreenElement \{Type = SpriteElement
			PARENT = root_window
			texture = White
			rgba = [
				255
				255
				255
				255
			]
			Dims = (1280.0, 720.0)
			Pos = (0.0, 0.0)
			just = [
				LEFT
				Top
			]
			z_priority = 1000}
		SpawnScriptNow \{do_extra_exploding_particles}
		RunScriptOnScreenElement Id = <Id> explode_white_screen Params = {Id = <Id>}
		if (<text_physics> = 1)
			do_exploding_text_physics {
				PARENT = <PARENT>
				Time = <Time>
				exploding_text_array_size = <exploding_text_array_size>
				cont_pos = <cont_pos>
			}
		endif
		do_exploding_text_particle_physics
	elseif (<text_physics> = 1)
		do_exploding_text_physics {
			PARENT = <PARENT>
			Time = <Time>
			exploding_text_array_size = <exploding_text_array_size>
			cont_pos = <cont_pos>
		}
	endif
endscript

script do_extra_exploding_particles \{z_priority = 8.0
		Pos = (640.0, 200.0)
		PARENT = exploding_particle_container}
	if ScreenElementExists \{Id = extra_particles}
		Destroy2DParticleSystem \{Id = extra_particles}
	endif
	Create2DParticleSystem {
		Id = extra_particles
		Pos = <Pos>
		PARENT = <PARENT>
		z_priority = <z_priority>
		Material = sys_Particle_Spark01_sys_Particle_Spark01
		start_color = [255 66 0 255]
		end_color = [128 0 0 0]
		start_scale = (2.0, 2.0)
		end_scale = (0.5, 0.5)
		start_angle_spread = 0.0
		min_rotation = 0.0
		max_rotation = 0.0
		emit_start_radius = 20.0
		emit_radius = 20.0
		Emit_Rate = 0.001
		emit_dir = 0
		emit_spread = 360.0
		Velocity = 16.0
		Friction = (0.0, 20.0)
		Time = 1.5
	}
	SoundEvent \{Event = You_Rock_Explosion}
	Wait \{1.5
		Seconds}
	Destroy2DParticleSystem \{Id = extra_particles
		Kill_when_empty}
	return
endscript

script explode_white_screen 
	DoScreenElementMorph Id = <Id> Alpha = 0 Time = 0.1
	Wait \{0.1
		Seconds}
	DestroyScreenElement Id = <Id>
endscript

script do_exploding_text_physics 
	<force_pos> = (640.0, 680.0)
	<explode_const> = 5000000
	<I> = 0
	begin
	FormatText ChecksumName = physics_container '%p_%i' P = <PARENT> I = <I>
	GetScreenElementProps Id = <physics_container>
	SetScreenElementProps Id = <physics_container> apply_gravity apply_drag
	<Force> = (<Pos> + <cont_pos> - <force_pos> + (RandomRange (-300.0, 300.0) * (1.0, 0.0)))
	normalize_vector vect = <Force>
	<physics_container> :ApplyForce Force = (<vect> * <explode_const>)
	if ((<vect>.(1.0, 0.0)) < 0)
		<rot> = -720.0
	else
		<rot> = 720.0
	endif
	<rot> = (<rot> * RandomRange (0.5, 2.0))
	GetRandomValue \{A = 3
		B = 7
		Name = rand_time}
	DoScreenElementMorph Id = <physics_container> Rot_Angle = <rot> Time = <rand_time> Motion = ease_out
	RunScriptOnScreenElement Id = <physics_container> check_screen_collisions Params = {Id = <physics_container> top_offset = -100 bottom_offset = 300}
	<I> = (<I> + 1)
	repeat <exploding_text_array_size>
endscript

script do_exploding_text_particle_physics 
	<force_pos> = (640.0, 680.0)
	<explode_const> = 7000000
	<I> = 0
	begin
	FormatText ChecksumName = particle_id 'particle_%i' I = <I>
	DoScreenElementMorph Id = <particle_id> Alpha = 1.0 Time = 0.5
	DoScreenElementMorph Id = <particle_id> Scale = 3.0 relative_scale Time = 1.0
	GetScreenElementProps Id = <particle_id>
	SetScreenElementProps Id = <particle_id> apply_gravity
	<Force> = (<Pos> - <force_pos>)
	normalize_vector vect = <Force>
	<particle_id> :ApplyForce Force = (<vect> * <explode_const>)
	RunScriptOnScreenElement Id = <particle_id> check_screen_collisions Params = {Id = <particle_id> top_offset = -100 bottom_offset = 200}
	<I> = (<I> + 1)
	repeat ($num_exploding_particles)
	Wait \{1.0
		Seconds}
	<I> = 0
	begin
	FormatText ChecksumName = particle_id 'particle_%i' I = <I>
	GetRandomValue \{A = 0.1
		B = 3.0
		Name = rand_time}
	DoScreenElementMorph Id = <particle_id> Alpha = 0 Time = <rand_time>
	<I> = (<I> + 1)
	repeat ($num_exploding_particles)
endscript

script split_text_into_physics_array_elements \{Text = "You Rock!"
		text_pos = (0.0, 0.0)
		space_between = (0.0, 0.0)
		flags = {
		}}
	StringToCharArray String = <Text>
	GetArraySize <char_array>
	<fit_scale> = 1.0
	if GotParam \{fit_dims}
		CreateScreenElement {
			Type = TextElement
			PARENT = root_window
			Text = <Text>
			font = (<flags>.font)
			Scale = (<flags>.Scale)
		}
		GetScreenElementDims Id = <Id>
		StringLength String = <Text>
		avg_width = (<width> / <str_len>)
		<fudge_factor> = 10
		avg_width = (<avg_width> + <fudge_factor>)
		fit_scale = ((<fit_dims>.(1.0, 0.0)) / (<str_len> * <avg_width>))
		if (<fit_scale> > 1.6)
			<fit_scale> = 1.6
		elseif (<fit_scale> < 0.625)
			<fit_scale> = 0.625
		endif
		<y_offset> = 0
		if (<fit_scale> < 1.0)
			<y_offset> = ((<Height> - (<Height> * <fit_scale>)) / 2)
			<text_pos> = (<text_pos> + (<y_offset> * (0.0, 1.0)))
		endif
		<Height> = (<Height> * <fit_scale>)
		if (<placement> = Top)
			Change g_ui_exploding_text_top_height = <Height>
		else
			<cont_pos_x> = ($g_ui_exploding_text_top_pos.(1.0, 0.0))
			<cont_pos_y> = (($g_ui_exploding_text_top_pos.(0.0, 1.0)) + (($g_ui_exploding_text_top_height + <Height>) / 2))
			<cont_pos> = ((<cont_pos_x> * (1.0, 0.0)) + (<cont_pos_y> * (0.0, 1.0)))
		endif
		<space_between> = ((<avg_width> * <fit_scale>) * (1.0, 0.0))
		destroy_menu menu_id = <Id>
	endif
	if GotParam \{centered}
		half_width = ((<array_Size> - 1) * (<space_between>.(1.0, 0.0)) * 0.5)
		<text_pos> = (<text_pos> - <half_width> * (1.0, 0.0))
	endif
	FormatText ChecksumName = cont_id '%p' P = <PARENT>
	CreateScreenElement {
		Type = ContainerElement
		Id = <cont_id>
		PARENT = root_window
		Pos = <cont_pos>
	}
	I = 0
	begin
	FormatText ChecksumName = physics_container '%p_%i' P = <PARENT> I = <I>
	CreateScreenElement {
		Type = PhysicsElement
		Id = <physics_container>
		PARENT = <cont_id>
		Pos = <text_pos>
		Center = (640.0, 290.0)
		Radius = 85.5
		elasticity = 0.3
		just = <just>
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <physics_container>
		Pos = (0.0, 0.0)
		Text = (<char_array> [<I>])
		<flags>
		Scale = (<flags>.Scale * <fit_scale>)
		Alpha = (<flags>.Alpha)
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 50)
		<Mass> = (<width> * 2.0)
	else
		<Mass> = 100.0
	endif
	SetScreenElementProps Id = <physics_container> Mass = <Mass>
	CreateScreenElement {
		Type = TextElement
		PARENT = <physics_container>
		Text = (<char_array> [<I>])
		<flags>
		z_priority = (<flags>.z_priority - 1)
		rgba = [184 134 11 255]
		just = [Center Center]
		Pos = (0.0, 0.0)
		Alpha = (<flags>.Alpha)
		Scale = (<flags>.Scale * (1.15, 1.1) * <fit_scale>)
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <physics_container>
		Text = (<char_array> [<I>])
		<flags>
		z_priority = (<flags>.z_priority - 2)
		rgba = [0 0 0 255]
		just = [Center Center]
		Pos = (0.0, 0.0)
		Alpha = (<flags>.Alpha)
		Scale = (<flags>.Scale * (1.3, 1.2) * <fit_scale>)
	}
	<text_pos> = (<text_pos> + <space_between>)
	<I> = (<I> + 1)
	repeat <array_Size>
	return exploding_text_array_size = <array_Size>
endscript
