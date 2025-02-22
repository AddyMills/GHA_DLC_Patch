loading_screen_tips = [
	"Gibt es Probleme?  Wirf einen Blick auf die Tutorials im Trainings-Menü."
	"Gibt es Probleme?  Wirf einen Blick auf die Tutorials im Trainings-Menü."
	"Durchstöbere den Vault nach neuen Songs, coolen Outfits und Modellen."
	"Durchstöbere den Vault nach neuen Songs, coolen Outfits und Modellen."
	"Der Übungsmodus kann Dir beim Bewältigen dieser schwierigen Solos helfen."
	"Der Übungsmodus kann Dir beim Bewältigen dieser schwierigen Solos helfen."
	"Willst du deinem Fernseher die Schuld an deinen miesen Fertigkeiten geben?  Wähle 'Latenz kalibrieren' im Optionsmenü."
	"Willst du deinem Fernseher die Schuld an deinen miesen Fertigkeiten geben?  Wähle 'Latenz kalibrieren' im Optionsmenü."
	"Wird Dir das alleine Spielen langsam langweilig? Dann geh online und miss Dich an LIVE-Gegnern!"
	"Veröffentliche Deine eigenen Guitar Hero-Statistiken im Internet. Auf guitarhero.com erfährst Du wie!"
	"Spiele Guitar Hero und gewinne Sachen! Informiere dich im Online-Menü über Turniere."
	"Verlinke zu Deinen Spielstatistiken, finde Groupies und gründe eine Online-Band auf guitarhero.com!"
	"Du willst im Koop-Modus spielen, hast aber keinen Freund? Spiel online, um Leute kennenzulernen und abzujammen!"
	"Wer ist ein Gitarrengott? Sieh auf den Bestenlisten im Online-Menü oder im Internet auf guitarhero.com nach."
]
loading_screen_tips_per_venue = [
	{
		tips_array = [
			"Der erste Auftritt von Aerosmith war an der Nipmuc Regional High in Hopkinton, Massachusetts."
			"Bei ihrem ersten Auftritt spielte die Band Aerosmith-Versionen von 'Good Times Bad Times' und 'Great Balls of Fire'."
			"Die allerersten Aerosmith-Proben fanden im Keller der Boston University statt."
			"Aerosmith eröffneten ihren ersten Gig in der Nipmuc Highschool mit 'Route 66'."
			"In den Anfangstagen der Band spielten Aerosmith vor dem Gebäude des Studentenwerks der Boston University."
		]
	}
	{
		tips_array = [
			"In den zwei Jahrzehnten am Union Square zog Max's Kansas City Leute wie Mick Jagger, Bob Dylan und John Lennon an."
			"In den Siebzigern wurde Max's Kansas City eine der Geburtsstätten des Punk, mit Auftritten von Bands wie The New York City Dolls und den Ramones."
			"Sowohl Aerosmith als auch Bruce Springsteen und Bob Marley hatten ihre ersten Auftritte in New York in Max's Kansas City."
			"'No Surprize' erzählt die Geschichte von Clive Davis, wie er die Band nach einer Show in Max's Kansas City unter Vertrag nahm."
			"Nach der Trennung der Sex Pistols, hatte Sid Vicious viele seiner Soloauftritte in Max's Kansas City."
			"Max's Kansas City schloss 1981 endgültig seine Tore, aber das Gebäude steht noch."
			"Im Sommer 1970 hatten The Velvet Underground ihre letzten Shows mit Lou Reed in Max's Kansas City."
			"In Max's Kansas City wurde allnächtlich Musikgeschichte geschrieben, wenn Superstars wie Patti Smith, David Bowie und Iggy Pop die Bühne betraten."
		]
	}
	{
		tips_array = [
			"Joe Perry verließ die Band 1979 und kehrte erst 1984 wieder zurück."
			"Aerosmiths Rückkehr begann am Valentinstag 1984, als sich die Band nach einem Auftritt im Orpheum Theater in Boston wieder zusammen tat."
			"1986 kam Aerosmith zum ersten Mal seit sechs Jahren wieder in die Charts, als sie zusammen mit Run DMC 'Walk this Way' neu aufnahmen."
			"1984 begannen Aerosmith mit ihrer Wiedervereinigungstournee 'Back in the Saddle' und nahmen unterwegs das Live-Album 'Classic Live II' auf."
			"1987 veröffentlichten Aerosmith ihr neuntes Album 'Permanent Vacation'.  Das Album erhielt schon nach kurzer Zeit dreifaches Platin."
		]
	}
	{
		tips_array = [
			"Aerosmith musste die Auftritte in Russland für die 'Nine Lives Tour' absagen und konnte erst Jahre später zurückkehren."
			"Aerosmith ist in der ganzen Welt aufgetreten und hatte ausverkaufte Shows in Indien, Japan und den Vereinigten Arabischen Emiraten."
			"Aerosmiths zwölftes Studioalbum 'Nine Lives' hatte sein Debüt auf Platz Eins der US-Charts."
			"1998 beendete Aerosmith als erste internationale Band eine vollständig ausverkaufte Dome-Tour durch Japan."
			"1998 wurden Aerosmith für zwei Grammys nomminiert, einschließlich Bestes Rock-Album für 'Nine Lives'."
		]
	}
	{
		tips_array = [
			"'Just Push Play' wurde im 'The Boneyard' aufgenommen, einem Studio im Haus von Joe Perry."
			"Im Januar 2001 betrat Aerosmith die Bühne während der großen Halbzeit-Show für eine All-Star-Aufführung von 'Walk this way'."
			"'Just Push Play' hatte sein Debüt in den US Charts auf Platz Zwei."
			"'Just Push Play' ist Aerosmiths dreizehntes Studioalbum und erhielt Platin noch im Monat der Veröffentlichung."
		]
	}
	{
		tips_array = [
			"Im April 1998 wurde in der Rock and Roll Hall of Fame ein Aerosmith- Austellungsstück aufgestellt."
			"2001 wurden Aerosmith zusammen mit Queen und Steely Dan in die Rock and Roll Hall of Fame aufgenommen. "
			"Aerosmith ist die einzige Band, die in die Rock and Roll Hall of Fame aufgenommen wurde, während sie einen Hit im Radio hatten."
			"Bei der Einführungszeremonie in der Rock and Roll Hall of Fame im Jahr 2001 spielten Aerosmith 'Sweet Emotion' mit Kid Rock."
			"Nach der Zeremonie in der Hall of Fame hat Steven 'Just Push Play' mit der Stimme von Kid Rock nachgeschnitten."
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
			text = "LÄDT..."
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
