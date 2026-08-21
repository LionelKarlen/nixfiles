{ inputs, ... }:
{
  den.aspects.lionel = {
    provides.glade = {

      homeManager =
        { pkgs, ... }:
        {
          home.packages =
            (with pkgs.nerd-fonts; [
              hasklug
              blex-mono
              inconsolata
            ])
            ++ (with pkgs; [
              ioskeley-mono.normal-NF
            ]);

          stylix = {
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
                name = "Hasklug Nerd Font Mono";
              };
            };
            targets = {
              ghostty = {
                fonts.enable = false;
              };
            };
          };
        };
    };
  };
}
