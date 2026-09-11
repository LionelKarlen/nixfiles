{ inputs, ... }:
{
  den.aspects.edu = {
    homeManager =
      { pkgs, config, ... }:
      {
        nixpkgs.overlays = [
          inputs.self.overlays.default
        ];
        home.packages = with pkgs.local; [ tiki ];
        home.file."${config.xdg.configHome}/tiki/config.yaml".source = ../../files/tiki/config.yaml;
        home.file."${config.xdg.configHome}/tiki/workflow.yaml".source = ../../files/tiki/workflow.yaml;
      };
  };
}
