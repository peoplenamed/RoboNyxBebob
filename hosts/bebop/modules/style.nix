{
  config,
  pkgs,
  ...
}: {
  modules.style = {
    forceGtk = true;
    useKvantum = true;

    gtk = {
      usePortal = true;
      theme = {
        name = "Catppuccin-Mocha-Standard-Blue-Dark";
        package = pkgs.catppuccin-gtk.override {
          size = "standard";
          accents = ["blue"];
          variant = "mocha";
          tweaks = ["normal"];
        };
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders.override {
          accent = "blue";
          flavor = "mocha";
        };
      };

      font = {
        name = "Lexend";
        size = 12;
      };
    };

    qt = {
      theme = {
        name = "Catppuccin-Mocha-Dark";
        package = pkgs.catppuccin-kde.override {
          flavour = ["latte"];
          accents = ["mauve"];
          winDecStyles = ["modern"];
        };
      };

      kdeglobals.source = "${config.modules.style.qt.theme.package}" + "/share/color-schemes/CatppuccinMochaBlue.colors";
    };
  };
}
