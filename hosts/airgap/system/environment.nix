{pkgs, ...}: {
  environment = {
    # Yubikey tooling
    systemPackages = with pkgs; [
      polkit
      caligula

      yubikey-personalization
      cryptsetup
      pwgen
      paperkey
      gnupg
      ctmg
    ];

    # needed for i3blocks
    pathsToLink = ["/libexec"];

    # fix an annoying warning
    etc."mdadm.conf".text = ''
      MAILADDR root
    '';
  };
}
