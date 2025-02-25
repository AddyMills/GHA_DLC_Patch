online_signin_autoload_required = 0

script create_online_signin_splash 
	create_menu_backdrop \{texture = Online_Background}
	begin
	if ($net_safe_to_enter_net_play = 1)
		break
	else
		Wait \{0.5
			Seconds}
	endif
	repeat
	Wait \{2
		frames}
	Change \{online_signin_autoload_required = 0}
	if CheckForSignIn
		NetSessionFunc \{func = OnlineSignIn}
	else
		if IsXENON
			warning_options = [{func = online_signin_select_signin Text = "SIGN IN"} {func = online_signin_select_cancel Text = "CANCEL"}]
			if IsXENON
				if (NetSessionFunc func = is_cable_unplugged)
					sign_in_text = "Unable to connect to Xbox LIVE. Please check your network connection and settings and try again."
					warning_options = [{func = online_signin_select_cancel Text = "CONTINUE"}]
				elseif (CheckForSignIn local)
					sign_in_text = "You are currently not signed into Xbox LIVE or the current gamer profile is not enabled for Xbox LIVE multiplayer game play."
				else
					sign_in_text = "No gamer profile currently signed in. Please sign into an Xbox LIVE multiplayer enabled gamer profile to continue."
				endif
			else
				sign_in_text = "The current profile does not have permission to enter the lobby."
			endif
			if ScreenElementExists \{Id = popup_warning_container}
				return
			endif
			create_popup_warning_menu {
				textblock = {
					Text = <sign_in_text>
					Dims = (700.0, 320.0)
					Scale = 0.6
				}
				no_background
				Menu_pos = (640.0, 465.0)
				dialog_dims = (600.0, 80.0)
				helper_pills = [SELECT UPDOWN]
				options = <warning_options>
			}
		else
			NetSessionFunc \{func = OnlineSignIn}
		endif
	endif
endscript

script destroy_online_signin_splash 
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script online_signin_select_signin 
	Change \{online_signin_autoload_required = 1}
	NetSessionFunc \{func = OnlineSignIn}
endscript

script online_signin_select_cancel 
	ui_flow_manager_respond_to_action \{action = cancel}
endscript
