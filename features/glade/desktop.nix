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
    ])
    ++ (with pkgs-unstable; [
      freetube
      gnome-network-displays
    ]);

  services.gnome-keyring.enable = true;

  programs.zen-browser.enable = true;
}
