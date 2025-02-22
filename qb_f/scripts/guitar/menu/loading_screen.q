loading_screen_tips = [
	"Des soucis ?  Jette un coup d'oeil aux didacticiels du menu Entraînement."
	"Des soucis ?  Jette un coup d'oeil aux didacticiels du menu Entraînement."
	"Va faire un tour dans The Vault pour découvrir des nouvelles chansons, des tenues et des styles super cool."
	"Va faire un tour dans The Vault pour découvrir des nouvelles chansons, des tenues et des styles super cool."
	"Un peu d'entraînement devrait t'aider à maîtriser ces solos pas faciles."
	"Un peu d'entraînement devrait t'aider à maîtriser ces solos pas faciles."
	"Tu veux t'en prendre à la télé parce que t'es vraiment mauvais ? Va plutôt dans le menu Options pour calibrer le décalage."
	"Tu veux t'en prendre à la télé parce que t'es vraiment mauvais ? Va plutôt dans le menu Options pour calibrer le décalage."
	"Quoi ? Les solos c'est du passé ? Participe en ligne à des compétitions LIVE !"
	"Télécharge tes stats Guitar Hero sur le Web. Va sur guitarhero.com pour en savoir plus !"
	"Gagne des trucs en jouant à Guitar Hero ! Rends-toi sur le menu en ligne pour plus d'informations sur les tournois."
	"Affiche tes stats, rencontre tes groupies et forme un groupe en ligne sur guitarhero.com !"
	"Tu veux jouer en mode Coop mais tu n'as pas d'amis ? Va en ligne te trouver un partenaire de rock !"
	"Qui est un dieu du rock ? Jette un oeil sur les Classements du menu en ligne ou sur guitarhero.com."
]
loading_screen_tips_per_venue = [
	{
		tips_array = [
			"Le premier concert d'Aerosmith eu lieu à Nipmuc Regional High à Hopkinton dans le Massachussetts."
			"Le 1er concert du groupe comprenait les versions d'Aerosmith de 'Good Times Bad Times' et de 'Great Balls of Fire'."
			"Les toutes premières répétitions d'Aerosmith se déroulèrent dans les sous-sols de l'université de Boston."
			"Pour leur premier concert au lycée Nipmuc, Aerosmith commença avec 'Route 66'"
			"Les premiers temps, Aerosmith jouait ses concerts hors du bâtiment de la Student Union de l'université de Boston."
		]
	}
	{
		tips_array = [
			"Installé pendant deux décennies à Union Square, le Max's Kansas City a attiré des personnalités comme Mick Jagger, Bob Dylan ou encore John Lennon."
			"En accueillant des groupes tels que The New York Dolls et The Ramones, le Max's Kansas City est devenu le berceau de la musique punk."
			"Aerosmith, Bruce Springsteen et Bob Marley ont donné leur premier concert à New York dans le Max's Kansas City."
			"'No Surprize' raconte la signature du groupe avec Clive Davis après leur concert au Max's Kansas City."
			"Après la séparation des Sex Pistols, Sid Vicious a donné beaucoup de concerts en solo à Max's Kansas City."
			"Le Max's Kansas City a définitivement fermé ses portes en 1981 mais le bâtiment existe toujours."
			"The Velvet Underground a joué ses derniers concerts avec Lou Reed au Max's Kansas City l'été 1970."
			"Max's Kansas City a écrit l'histoire de la musique en accueillant sur scène des grandes stars tels que Patti Smith, David Bowie et Iggy Pop."
		]
	}
	{
		tips_array = [
			"Joe Perry a quitté le groupe en 1979 et n'a repris sa place qu'en 1984."
			"Aerosmith a fêté son retour le jour de la Saint Valentin 1984, lorsque le groupe s'est réuni pour le concert qu'il a donné à l'Orpheum Theater de Boston."
			"En 1986, Aerosmith a fait un bond dans le hit-parade (il n'avait pas connu ça depuis 6 ans) grâce au réenregistrement de 'Walk This Way' avec Run DMC."
			"En 1984, Aerosmith se lança dans la tournée de réunification 'Back in the Saddle' et enregistra en chemin l'album live 'Classics Live II'."
			"En 1987, Aerosmith sortit son neuvième album 'Permanent Vacation'.  L'album devint rapidement un triple album de platine."
		]
	}
	{
		tips_array = [
			"Aerosmith a dû annuler tous ses concerts en Russie lors de la tournée 'Nine Lives', le groupe n'a pu y retourner que des années plus tard."
			"Aerosmith s'est produit partout dans le monde dont des spectacles à guichets fermés en Inde, au Japon et aux Émirats arabes unis."
			"Le 12e album studio d'Aerosmith, 'Nine Lives', est entré directement numéro un du hit-parade américain."
			"En 1998, Aerosmith a joué sa tournée 'Dome' au Japon à guichet fermé. C'est la première fois qu'un artiste international relève ce défi."
			"En 1998, Aerosmith fut nominé pour deux Grammy dont le Meilleur Album Rock pour 'Nine Lives'."
		]
	}
	{
		tips_array = [
			"'Just Push Play' a été enregistré à The Boneyard, un studio d'enregistrement qui se trouve dans la maison de Joe Perry."
			"En janvier 2001, Aerosmith joua 'Walk This Way' avec différents artistes lors du spectacle de la mi-temps du Super Bowl."
			"'Just Push Play' est rentré directement à la deuxième place du hit-parade américain."
			"'Just Push Play' est le 13e album en studio d'Aerosmith et fut certifié album de platine un mois après sa sortie."
		]
	}
	{
		tips_array = [
			"Aerosmith a eu sa propre exposition au Rock and Roll Hall of Fame en avril 1998."
			"Aerosmith a été introduit au Rock and Roll Hall of Fame en 2001.  Queen et Steely Dan y furent également introduits cette même année."
			"Aerosmith est le seul groupe à avoir été admis au Rock and Roll Hall of Fame alors qu'une de ses chansons était sur les ondes."
			"Lors de son introduction au Rock and Roll Hall of Fame en 2001, Aerosmith joua 'Sweet Emotion' avec Kid Rock."
			"Après la cérémonie, Steven retravailla 'Just Push Play' avec des voix de Kid Rock."
		]
	}
]
g_loading_screen_split_container_id = id

script create_loading_screen \{mode = play_song}
	menu_music_off
	kill_start_key_binding
	if ($is_changing_levels = 1)
		return
	endif
	change \{is_changing_levels = 1}
	getrandomvalue \{name = global_or_not
		a = 0
		b = 1
		integer}
	if (<global_or_not> = 0)
		getarraysize ($loading_screen_tips)
		getrandomvalue name = rand_num a = 0 b = (<array_size> - 1) integer
		rand_tip = ($loading_screen_tips [<rand_num>])
	else
		getarraysize (($loading_screen_tips_per_venue [$g_venue_index]).tips_array)
		getrandomvalue name = rand_num a = 0 b = (<array_size> - 1) integer
		rand_tip = (($loading_screen_tips_per_venue [$g_venue_index]).tips_array [<rand_num>])
	endif
	if (<mode> = play_song || <mode> = play_encore || <mode> = play_boss || <mode> = restart_song)
		killspawnedscript \{name = jiggle_text_array_elements}
		if screenelementexists \{id = $g_loading_screen_split_container_id}
			destroyscreenelement \{id = $g_loading_screen_split_container_id}
		endif
		killallmovies
		movie = 'loading_flying'
		if NOT ismovieinbuffer movie = <movie>
			buffer_slot = 0
			freemoviebuffer buffer_slot = <buffer_slot>
			if gotextramemory
				mempushcontext \{debugheap}
			endif
			allocatemoviebuffer buffer_slot = <buffer_slot> movie = 'movies\\bik\\loading_flying.bik.xen'
			if gotextramemory
				mempopcontext
			endif
			loadmovieintobuffer buffer_slot = <buffer_slot> movie = <movie>
		endif
		playmoviefrombuffer {
			buffer_slot = <buffer_slot>
			textureslot = 2
			no_hold
			wait_until_rendered
			texturepri = 4999
		}
		createscreenelement {
			type = textblockelement
			parent = root_window
			id = loading_tip_text
			text = <rand_tip>
			font = text_a4
			scale = 0.8
			just = [center center]
			dims = (300.0, 480.0)
			pos = (900.0, 300.0)
			rgba = [255 255 255 255]
			z_priority = 5000
			allow_expansion
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
		}
		createscreenelement \{type = textelement
			parent = root_window
			id = loading_text
			text = "CHARGEMENT..."
			font = text_a10
			scale = 2.0
			just = [
				right
				center
			]
			pos = (1000.0, 580.0)
			rgba = [
				255
				255
				255
				255
			]
			z_priority = 5000
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]}
		getscreenelementdims id = <id>
		fit_text_in_rectangle only_if_larger_x = 1 id = <id> dims = ((200.0, 0.0) + (<height> * (0.0, 1.0))) start_x_scale = 2.0 start_y_scale = 2.0
	else
		killspawnedscript \{name = destroy_loading_screen_spawned}
		createscreenelement \{type = containerelement
			parent = root_window
			id = loading_screen_container
			pos = (0.0, 0.0)}
		createscreenelement \{type = spriteelement
			parent = loading_screen_container
			texture = loading_flying_static
			pos = (640.0, 360.0)
			just = [
				center
				center
			]
			dims = (1280.0, 720.0)}
	endif
endscript

script wait_and_play_loading_movie 
	begin
	if (ismoviepreloaded textureslot = 2)
		startpreloadedmovie \{textureslot = 2}
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script destroy_loading_screen 
	destroy_menu \{menu_id = loading_tip_text}
	destroy_menu \{menu_id = loading_text}
	killspawnedscript \{name = jiggle_text_array_elements}
	if screenelementexists \{id = $g_loading_screen_split_container_id}
		destroyscreenelement \{id = $g_loading_screen_split_container_id}
	endif
	if ismovieplaying \{textureslot = 2}
		killmovie \{textureslot = 2}
	endif
	spawnscriptnow \{destroy_loading_screen_spawned}
	hideloadingscreen
	if ($playing_song = 0)
		change \{is_changing_levels = 0}
	endif
endscript

script destroy_loading_screen_spawned \{time = 0.3}
	onexitrun \{destroy_loading_screen_finish}
	if (<time> > 0)
		if screenelementexists \{id = menu_backdrop_container}
			doscreenelementmorph id = menu_backdrop_container alpha = 0 time = <time>
		endif
		if screenelementexists \{id = loading_screen_container}
			doscreenelementmorph id = loading_screen_container alpha = 0 time = <time>
		endif
		wait <time> seconds
	endif
endscript

script destroy_loading_screen_finish 
	if screenelementexists \{id = loading_screen_container}
		destroyscreenelement \{id = loading_screen_container}
	endif
	destroy_menu_backdrop
endscript

script refresh_screen 
	destroy_loading_screen
	create_loading_screen
endscript
