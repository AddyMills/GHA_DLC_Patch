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
			warning_options = [{func = online_signin_select_signin text = "SE CONNECTER"} {func = online_signin_select_cancel text = "ANNULER"}]
			if isxenon
				if (netsessionfunc func = is_cable_unplugged)
					sign_in_text = "Impossible de se connecter à Xbox LIVE. Vérifiez votre connexion réseau et les paramètres et réessayez."
					warning_options = [{func = online_signin_select_cancel text = "CONTINUER"}]
				elseif (checkforsignin local)
					sign_in_text = "Vous n'êtes pas enregistré sur le Xbox LIVE actuellement ou bien le profil du joueur ne permet pas les parties multijoueurs Xbox LIVE."
				else
					sign_in_text = "Aucun profil du joueur n'est connecté. Connecte-toi à un profil du joueur qui permet les parties multijoueur Xbox LIVE pour continuer."
				endif
			else
				sign_in_text = "Le profil connecté n'est pas autorisé à accéder à l'accueil."
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
