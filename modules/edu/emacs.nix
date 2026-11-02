{ inputs, ... }: {
  den.aspects.edu = {
    homeManager =
      let
        pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
      in
      {
        programs.emacs = {
          enable = true;
          package = pkgs-unstable.emacs; # replace with pkgs.emacs-gtk if desired
          extraPackages = epkgs: [
            epkgs.meow
          ];
          extraConfig = "";
        };
      };
  };
}
