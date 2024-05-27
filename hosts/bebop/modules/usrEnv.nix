{
  modules.usrEnv = {
    desktop = "Hyprland";
    wallpaperService = "hyprpaper";
    wayland = {
      statusBar = {
        waybar.enable = true;
      };
    };

    programs.screenlock.swaylock.enable = true;
  };
}
