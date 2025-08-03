{pkgs, ...}: {
  home.packages = with pkgs.nerd-fonts; [
    hasklug
    blex-mono
  ];
  fonts.fontconfig.enable = true;

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-light.yaml";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dm-sans;
        name = "DM Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.hasklug;
        name = "Hasklug Nerd Font";
      };
    };

    targets = {
      # disabling nixvim stops the nixvim internal theming from working too, so just ignore it
      neovim.enable = false;
    };
  };
}
