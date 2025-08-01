{pkgs, ...}: {
  home.packages = with pkgs.nerd-fonts; [
    hasklug
    blex-mono
  ];
  fonts.fontconfig.enable = true;
}
