#hyprlandConfig.nix
''
  #config here…
  exec-once = /nix/store/bnipzdfv788l7yvgn7k7s7gp76sd1zpz-dbus-1.14.10/bin/dbus-update-activation-environment --systemd --all && systemctl --user stop hyprland-session.target && systemctl --user start hyprland-session.target
  $MOD=SUPER
  $disable=act_opa=$(hyprctl getoption "decoration:active_opacity" -j | jq -r ".float");inact_opa=$(hyprctl getoption "decoration:inactive_opacity" -j | jq -r ".float");hyprctl --batch "keyword decoration:active_opacity 1;keyword decoration:inactive_opacity 1"
  $enable=hyprctl --batch "keyword decoration:active_opacity $act_opa;keyword decoration:inactive_opacity $inact_opa"
  $kw=dwindle:no_gaps_when_only
  animations {
    bezier=smoothOut, 0.36, 0, 0.66, -0.56
    bezier=smoothIn, 0.25, 1, 0.5, 1
    bezier=overshot, 0.4,0.8,0.2,1.2
    animation=windows, 1, 4, overshot, slide
    animation=windowsOut, 1, 4, smoothOut, slide
    animation=border,1,10,default
    animation=fade, 1, 10, smoothIn
    animation=fadeDim, 1, 10, smoothIn
    animation=workspaces,1,4,overshot,slide
    enabled=true
  }

  decoration {
    blur {
      brightness=0.800000
      contrast=0.700000
      enabled=true
      ignore_opacity=true
      new_optimizations=1
      passes=3
      size=5
      special=true
      vibrancy=0.200000
      xray=true
    }
    col.shadow=rgba(292c3cee)
    drop_shadow=yes
    rounding=7
    shadow_range=10
    shadow_render_power=3
  }

  dwindle {
    no_gaps_when_only=false
    preserve_split=yes
    pseudotile=false
    special_scale_factor=0.900000
  }

  general {
    apply_sens_to_raw=0
    border_size=2
    col.active_border=rgb(cba6f7) rgb(94e2d5) 45deg
    gaps_in=4
    gaps_out=8
    sensitivity=0.800000
  }

  group {
    groupbar {
      font_size=14
      gradients=false
      render_titles=false
      scrolling=true
    }
    col.border_active=rgba(88888888)
    col.border_inactive=rgba(00000088)
    focus_removed_window=true
    insert_after_current=true
  }

  input {
    touchpad {
      natural_scroll=no
    }
    float_switch_override_focus=1
    follow_mouse=2
    kb_layout=us
    numlock_by_default=true
  }

  misc {
    disable_autoreload=true
    disable_hyprland_logo=true
    disable_splash_rendering=true
    enable_swallow=true
    key_press_enables_dpms=true
    mouse_move_enables_dpms=true
    swallow_regex=foot|thunar|nemo|wezterm|kitty
  }
  bind=$MODSHIFT, Escape, exec, rofi-power-menu
  bind=$MODSHIFT,E,exit,
  bind=$MOD,F1,exec,google-chrome-stable
  bind=$MOD,RETURN,exec, run-as-service $(kitty)
  bind=$MOD,D,exec, killall rofi || run-as-service $(rofi -show drun)
  bind=$MOD,Space,exec, killall rofi || run-as-service $(rofi -show drun)
  bind=$MOD,period,exec, rofi-run-emoji
  bind=$MOD,Q,killactive,
  bind=$MOD,T,togglegroup,
  bind=$MODSHIFT,G,changegroupactive,
  bind=$MOD,V,togglefloating,
  bind=$MOD,P,pseudo,
  bind=$MOD,F,fullscreen,
  bind=$MOD,M,exec,hyprctl keyword $kw $(($(hyprctl getoption $kw -j | jaq -r '.int') ^ 1))
  bind=$MODCTRL,left,resizeactive, -80 0
  bind=$MODCTRL,right,resizeactive, 80 0
  bind=$MODCTRL,up,resizeactive, 0 -80
  bind=$MODCTRL,down,resizeactive, 0 80
  bind=$MOD ALT,left,moveactive, -80 0
  bind=$MOD ALT,right,moveactive, 80 0
  bind=$MOD ALT,up,moveactive, 0 -80
  bind=$MOD ALT,down,moveactive, 0 80
  bind=$MODSHIFT,right,movetoworkspace,+1
  bind=$MODSHIFT,left,movetoworkspace,-1
  bind=$MOD,mouse_down,workspace,e+1
  bind=$MOD,mouse_up,workspace,e-1
  bind=$MOD, left, movefocus, l
  bind=$MOD, right, movefocus, r
  bind=$MOD, up, movefocus, u
  bind=$MOD, down, movefocus, d
  bind=, Print, exec, grimblast --notify --cursor copy area
  bind=$MOD, Print, exec, grimblast --notify --cursor copysave output
  bind=$ALTSHIFT, S, exec, grimblast --notify --cursor copysave screen
  bind=$ALTSHIFT, R, exec, grimblast --notify --cursor copysave area
  bind=,XF86MonBrightnessUp,exec, /nix/store/81id03dynf716msd4js4z6gj6xy2gqkb-brightnessctl-0.5.1/bin/brightnessctl set +5%
  bind=,XF86MonBrightnessDown,exec, /nix/store/81id03dynf716msd4js4z6gj6xy2gqkb-brightnessctl-0.5.1/bin/brightnessctl set 5%-
  bind=,XF86AudioRaiseVolume, exec, /nix/store/pn9glkalcj7i5p549dpsl1c46pkb13xr-pulseaudio-17.0/bin/pactl  set-sink-volume @DEFAULT_SINK@ +6%
  bind=,XF86AudioLowerVolume, exec, /nix/store/pn9glkalcj7i5p549dpsl1c46pkb13xr-pulseaudio-17.0/bin/pactl  set-sink-volume @DEFAULT_SINK@ 6%-
  binde=,XF86AudioRaiseVolume, exec, /nix/store/pn9glkalcj7i5p549dpsl1c46pkb13xr-pulseaudio-17.0/bin/pactl  set-sink-volume @DEFAULT_SINK@ +6%
  binde=,XF86AudioLowerVolume, exec, /nix/store/pn9glkalcj7i5p549dpsl1c46pkb13xr-pulseaudio-17.0/bin/pactl  set-sink-volume @DEFAULT_SINK@ 6%-
  binde=,XF86MonBrightnessUp,exec, /nix/store/81id03dynf716msd4js4z6gj6xy2gqkb-brightnessctl-0.5.1/bin/brightnessctl set +5%
  binde=,XF86MonBrightnessDown,exec, /nix/store/81id03dynf716msd4js4z6gj6xy2gqkb-brightnessctl-0.5.1/bin/brightnessctl set 5%-
  binde=,XF86KbdBrightnessUp,exec, /nix/store/81id03dynf716msd4js4z6gj6xy2gqkb-brightnessctl-0.5.1/bin/brightnessctl -d asus::kbd_backlight set +1
  binde=,XF86KbdBrightnessDown,exec, /nix/store/81id03dynf716msd4js4z6gj6xy2gqkb-brightnessctl-0.5.1/bin/brightnessctl -d asus::kbd_backlight set 1-
  bindl=, XF86AudioMute, exec, /nix/store/pn9glkalcj7i5p549dpsl1c46pkb13xr-pulseaudio-17.0/bin/pactl set-mute @DEFAULT_AUDIO_SINK@ toggle
  bindl=, XF86AudioMicMute, exec, /nix/store/pn9glkalcj7i5p549dpsl1c46pkb13xr-pulseaudio-17.0/bin/pactl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
  bindm=$MOD,mouse:272,movewindow
  bindm=$MOD,mouse:273,resizewindow
  exec-once=hyprctl setcursor Catppuccin-Mocha-Dark-Cursors 24
  windowrulev2=noshadow, floating:0
  windowrulev2=float,class:udiskie
  windowrulev2=float,class:NordPass
  windowrulev2=idleinhibit focus,class:kitty
  windowrulev2=idleinhibit fullscreen, class:^(firefox)$
  windowrulev2=float,title:^(Firefox — Sharing Indicator)$
  windowrulev2=move 0 0,title:^(Firefox — Sharing Indicator)$
  windowrulev2=float, title:^(Picture-in-Picture)$
  windowrulev2=pin, title:^(Picture-in-Picture)$
  windowrulev2=opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$
  windowrulev2=float,class:pavucontrol
  windowrulev2=float,title:^(Volume Control)$
  windowrulev2=size 800 600,title:^(Volume Control)$
  windowrulev2=move 75 44%,title:^(Volume Control)$
  windowrulev2=float, class:^(imv)$
  windowrulev2=opacity 1.0 override 1.0 override, title:^(.*imv.*)$
  windowrulev2=opacity 1.0 override 1.0 override, title:^(.*mpv.*)$
  windowrulev2=opacity 1.0 override 1.0 override, class:(Aseprite)
  windowrulev2=opacity 1.0 override 1.0 override, class:(Unity)
  windowrulev2=idleinhibit focus, class:^(mpv)$
  windowrulev2=idleinhibit fullscreen, class:^(chrome)$
  windowrulev2=rounding 0, xwayland:1
  windowrulev2=workspace 6 silent, class:^(signal)$
  windowrulev2=windowdance,class:^(jetbrains-.*)$,floating:1
  windowrulev2=center,class:^(jetbrains-.*)$,title:^(splash)$,floating:1
  windowrulev2=nofocus,class:^(jetbrains-.*)$,title:^(splash)$,floating:1
  windowrulev2=noborder,class:^(jetbrains-.*)$,title:^(splash)$,floating:1
  windowrulev2=center,class:^(jetbrains-.*)$,title:^( )$,floating:1
  windowrulev2=stayfocused,class:^(jetbrains-.*)$,title:^( )$,floating:1
  windowrulev2=noborder,class:^(jetbrains-.*)$,title:^( )$,floating:1
  windowrulev2=nofocus,class:^(jetbrains-.*)$,title:^(win.*)$,floating:1
  # generate a list of monitors automatically, like so
  #monitor=HDMI-A-1,preferred,0x0,1
  # monitor=DP-1,preferred,1920x0,1

  monitor=,preferred,auto,auto
  monitor=eDP-1,1920x1200,auto,1

  # a submap for resizing windows
  bind = $MOD, S, submap, resize # enter resize window to resize the active window
  submap=resize
  binde=,right,resizeactive,10 0
  binde=,left,resizeactive,-10 0
  binde=,up,resizeactive,0 -10
  binde=,down,resizeactive,0 10
  bind=,escape,submap,reset
  submap=reset

  # workspace binds
  # binds * (asterisk) to special workspace
  bind = $MOD, KP_Multiply, togglespecialworkspace
  bind = $MODSHIFT, KP_Multiply, movetoworkspace, special

  # and mod + [shift +] {1..10} to [move to] ws {1..10}
  bind = $MOD, 1, workspace, 1
  bind = $MOD SHIFT, 1, movetoworkspace, 1

  bind = $MOD, 2, workspace, 2
  bind = $MOD SHIFT, 2, movetoworkspace, 2

  bind = $MOD, 3, workspace, 3
  bind = $MOD SHIFT, 3, movetoworkspace, 3

  bind = $MOD, 4, workspace, 4
  bind = $MOD SHIFT, 4, movetoworkspace, 4

  bind = $MOD, 5, workspace, 5
  bind = $MOD SHIFT, 5, movetoworkspace, 5

  bind = $MOD, 6, workspace, 6
  bind = $MOD SHIFT, 6, movetoworkspace, 6

  bind = $MOD, 7, workspace, 7
  bind = $MOD SHIFT, 7, movetoworkspace, 7

  bind = $MOD, 8, workspace, 8
  bind = $MOD SHIFT, 8, movetoworkspace, 8

  bind = $MOD, 9, workspace, 9
  bind = $MOD SHIFT, 9, movetoworkspace, 9

  bind = $MOD, 0, workspace, 10
  bind = $MOD SHIFT, 0, movetoworkspace, 10

''
