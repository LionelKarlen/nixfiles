{ inputs, ... }:
{
  den.aspects.shell = {
    homeManager =
      let
        pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
      in
      { pkgs, ... }:
      {
        home.packages =
          (with pkgs; [
            ripgrep
            unzip
            wget
            curl
            zip
            fzf
            fd
            htop
            mprocs
            treefmt
            nixfmt
          ])
          ++ (with pkgs-unstable; [
            just
          ]);
      };
  };
}
