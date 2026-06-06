{ inputs, ... }:
{
  den.aspects.edu = {
    homeManager =
      { pkgs, config, ... }:
      {
        nixpkgs.overlays = [
          inputs.self.overlays.default
        ];
        home.packages = with pkgs.local; [ quoin ];
        home.file."${config.xdg.configHome}/quoin/dict.txt".source = ../../files/quoin.txt;
      };
  };
}
