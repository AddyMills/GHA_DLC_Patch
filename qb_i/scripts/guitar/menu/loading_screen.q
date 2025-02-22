loading_screen_tips = [
	"Problemi con il gioco?  Accedi ai tutorial nel Menu di esercitazione."
	"Problemi con il gioco?  Accedi ai tutorial nel Menu di esercitazione."
	"Visita il Vault per nuovi brani, completi alla moda e stili."
	"Visita il Vault per nuovi brani, completi alla moda e stili."
	"Se ti eserciti un po' potrai dominare quegli assolo così complicati."
	"Se ti eserciti un po' potrai dominare quegli assolo così complicati."
	"Pensi che, se fai schifo, sia colpa della TV? Vai a Calibra ritardo nel menu Opzioni."
	"Pensi che, se fai schifo, sia colpa della TV? Vai a Calibra ritardo nel menu Opzioni."
	"Stanco di suonare da solo? Vai online e ingaggia qualche battaglia LIVE!"
	"Pubblica sul Web le tue statistiche personali di Guitar Hero. Accedi al sito guitarhero.com per scoprire come fare!"
	"Gioca e vinci con Guitar Hero! Consulta il menu online per saperne di più sui tornei."
	"Nel sito guitarhero.com puoi creare collegamenti alle statistiche di gioco, acquisire fan e fondare un gruppo!"
	"Vuoi un amico per suonare in modalità cooperativa? Vai online! Ci sono molte persone con cui suonare e fare amicizia!"
	"Chi è il Dio della chitarra? Controlla la classifica nel Menu online oppure in rete sul sito Web www.guitarhero.com."
]
loading_screen_tips_per_venue = [
	{
		tips_array = [
			"Gli Aerosmith tennero il loro primo concerto alla Nipmuc Regional High di Hopkinton, nel Massachusetts."
			"Nel primo concerto, gli Aerosmith hanno proposto rivisitazioni di 'Good Times Bad Times' e 'Great Balls of Fire'."
			"Le prime prove degli Aerosmith hanno avuto luogo nei seminterrati dell'università di Boston."
			"Al primo concerto alla Nipmuc High School, gli Aerosmith hanno esordito con 'Route 66'"
			"Nei primi tempi, gli Aerosmith suonavano davanti all'edificio del consiglio studentesco dell'università di Boston."
		]
	}
	{
		tips_array = [
			"Nel ventennio in Union Square, il Max's Kansas City ha ospitato artisti del calibro di Mick Jagger, Bob Dylan e John Lennon."
			"Il Max's Kansas City divenne una culla del punk, ospitando band quali The New York Dolls e The Ramones."
			"Gli Aerosmith, Bruce Springsteen e Bob Marley hanno tenuto i loro primi concerti al Max's Kansas City di New York."
			"'No Surprize' racconta la storia di Clive Davis, che scritturò il gruppo dopo uno show al Max's Kansas City."
			"Dopo lo scioglimento dei Sex Pistols, Sid Vicious ha tenuto molti concerti da solista al Max's Kansas City."
			"Il Max's Kansas City chiuse definitivamente i battenti nel 1981, ma l'edificio è ancora in piedi."
			"I Velvet Underground hanno tenuto l'ultimo concerto con Lou Reed al Max's Kansas City nell'estate del 1970."
			"Il Max's Kansas City ha ospitato la storia della musica sera dopo sera con le esibizioni di grandi star del rock come Patti Smith, David Bowie e Iggy Pop."
		]
	}
	{
		tips_array = [
			"Joe Perry lasciò il gruppo nel 1979 e non vi fece ritorno fino al 1984."
			"Il ritorno degli Aerosmith iniziò nel giorno di San Valentino del 1984, quando la band si riunì dopo un concerto all'Orpheum Theater di Boston."
			"Nel 1986, gli Aerosmith rientrarono nelle classifiche dopo sei anni di assenza grazie al remake di 'Walk This Way' con i Run-DMC."
			"Nel 1984, gli Aerosmith intrapresero il tour 'Back in the Saddle' per celebrare la loro reunion e registrarono l'album live 'Classics Live II'."
			"Nel 1987 gli Aerosmith pubblicarono il loro nono album, 'Permanent Vacation'.  L'album vinse in breve tempo tre dischi di platino."
		]
	}
	{
		tips_array = [
			"Gli Aerosmith dovettero cancellare le date russe del tour Nine Lives e non poterono tornarvi per diversi anni."
			"Gli Aerosmith hanno tenuto concerti in tutto il mondo, inclusi spettacoli a tutto esaurito in India, Giappone e negli Emirati Arabi Uniti."
			"Il dodicesimo album degli Aerosmith, 'Nine Lives', ha debuttato al numero 1 delle classifiche statunitensi."
			"Nel 1998 gli Aerosmith tennero un tour del Giappone con tutte le date esaurite: non si era mai verificato prima con artisti stranieri."
			"Nel 1998 gli Aerosmith furono nominati per due Grammy, uno dei quali per il Miglior Album Rock 'Nine Lives'."
		]
	}
	{
		tips_array = [
			"'Just Push Play' è stata registrata a The Boneyard, lo studio a casa di Joe Perry."
			"Nel gennaio 2001, gli Aerosmith si esibirono all'Half-Time Show con un'esecuzione da all-star di 'Walk This Way'."
			"'Just Push Play' ha debuttato al numero 2 delle classifiche statunitensi."
			"'Just Push Play' è il tredicesimo album degli Aerosmith e vinse il disco di platino appena un mese dopo la sua pubblicazione."
		]
	}
	{
		tips_array = [
			"Gli Aerosmith sono stati onorati da una mostra nell'aprile del 1998 presso la Rock and Roll Hall of Fame."
			"Nel 2001, gli Aerosmith entrarono di diritto nella Hall of Fame del Rock 'n' Roll. Nello stesso anno furono inclusi anche i Queen e Steely Dan."
			"Gli Aerosmith sono l'unico gruppo a essere entrato nella Rock 'n' Roll Hall of Fame con una hit alla radio."
			"Durante la cerimonia di passaggio alla Hall of Fame del Rock 'n' Roll, gli Aerosmith suonarono 'Sweet Emotion' insieme a Kid Rock."
			"Dopo la cerimonia della Hall of Fame, Steven suonò un arrangiamento di 'Just Push Play' con la collaborazione di Kid Rock alla voce."
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
			text = "CARICAMENTO"
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
