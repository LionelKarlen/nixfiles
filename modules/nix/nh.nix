{
  den.aspects.nix = {
    homeManager =
      { config, ... }:
      {
        programs.nh = {
          enable = true;
          flake = "/home/${config.home.username}/.nixfiles";
        };
      };
  };
}
