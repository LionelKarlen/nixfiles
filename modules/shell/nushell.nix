{ inputs, ... }: {
  den.aspects.shell =
    let
      pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
    in
    {
      homeManager = {
        home.packages = [ pkgs-unstable.nushell ];
      };
    };
}
