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
			warning_options = [{func = online_signin_select_signin text = "ANMELDEN"} {func = online_signin_select_cancel text = "ABBRECHEN"}]
			if isxenon
				if (netsessionfunc func = is_cable_unplugged)
					sign_in_text = "Keine Verbindung zu Xbox LIVE möglich. Bitte überprüfen Sie Ihre Netzwerkverbindung und Einstellungen und versuchen Sie es erneut."
					warning_options = [{func = online_signin_select_cancel text = "WEITER"}]
				elseif (checkforsignin local)
					sign_in_text = "Sie sind gegenwärtig nicht bei Xbox LIVE angemeldet oder das ausgewählte Profil ist für Xbox LIVE Multiplayerspiele nicht aktiviert."
				else
					sign_in_text = "Momentan ist kein Spielerprofil angemeldet. Bitte melden Sie sich mit einem Spielerprofil an, das für Xbox LIVE-Multiplayer aktiviert ist, um fortzufahren."
				endif
			else
				sign_in_text = "Mit dem aktuellen Profil dürfen sie die Lobby nicht betreten."
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
