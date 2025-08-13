{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages =
    (with pkgs; [
      zathura
      librewolf
      tor-browser
      brave
      libsecret
      libgnome-keyring
      vlc
      mpv
      qbittorrent
      protonvpn-gui
      proton-pass
      (prismlauncher.override {
        additionalLibs = [
          pkgs.nss
          pkgs.nspr
          pkgs.libgbm
        ];
      })
    ])
    ++ (with pkgs-unstable; [
      gnome-network-displays
    ]);

  programs.freetube = {
    enable = true;
    package = pkgs.callPackage ../packages/freetube/freetube.nix {};
  };

  services.gnome-keyring.enable = true;

  programs.zen-browser.enable = true;
  programs.spicetify.enable = true;
}
