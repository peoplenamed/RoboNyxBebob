{
  modules.usrEnv = {
    desktop = "Hyprland";
    wayland = {
      statusBar = {
        waybar.enable = true;
      };
      windowManager.hyprland = {
        enable = true;
        #        extraConfig = (import ./hyprpaperConfig.nix {
        #              inherit (config);
        #         });
      };
    };
    programs.screenlock.swaylock.enable = true;
  };
}
