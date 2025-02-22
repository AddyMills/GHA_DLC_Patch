online_signin_autoload_required = 0

script create_online_signin_splash 
	create_menu_backdrop \{texture = online_background}
	begin
	if ($net_safe_to_enter_net_play = 1)
		break
	else
		wait \{0.5
			seconds}
	endif
	repeat
	wait \{2
		frames}
	change \{online_signin_autoload_required = 0}
	if checkforsignin
		netsessionfunc \{func = onlinesignin}
	else
		if isxenon
			warning_options = [{func = online_signin_select_signin text = "ACCEDI"} {func = online_signin_select_cancel text = "ANNULLA"}]
			if isxenon
				if (netsessionfunc func = is_cable_unplugged)
					sign_in_text = "Impossibile connettersi a Xbox LIVE. Controlla la connessione e le impostazioni della rete e prova di nuovo."
					warning_options = [{func = online_signin_select_cancel text = "CONTINUA"}]
				elseif (checkforsignin local)
					sign_in_text = "Non sei collegato a Xbox LIVE o il tuo profilo giocatore non è abilitato al gioco multiplayer su Xbox LIVE."
				else
					sign_in_text = "Nessun profilo giocatore risulta connesso. Per continuare, accedere con un profilo giocatore abilitato per il gioco multiplayer su Xbox LIVE."
				endif
			else
				sign_in_text = "Il profilo corrente non dispone dell'autorizzazione per accedere alla lobby."
			endif
			if screenelementexists \{id = popup_warning_container}
				return
			endif
			create_popup_warning_menu {
				textblock = {
					text = <sign_in_text>
					dims = (700.0, 320.0)
					scale = 0.6
				}
				no_background
				menu_pos = (640.0, 465.0)
				dialog_dims = (600.0, 80.0)
				helper_pills = [select updown]
				options = <warning_options>
			}
		else
			netsessionfunc \{func = onlinesignin}
		endif
	endif
endscript

script destroy_online_signin_splash 
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script online_signin_select_signin 
	change \{online_signin_autoload_required = 1}
	netsessionfunc \{func = onlinesignin}
endscript

script online_signin_select_cancel 
	ui_flow_manager_respond_to_action \{action = cancel}
endscript
