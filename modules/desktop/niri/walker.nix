{
  den.aspects.niri = {
    homeManager = {
      services.elephant = {
        enable = true;
      };
      services.walker = {
        enable = true;
      };
      xdg.configFile."walker/config.toml".text = ''theme="elk"'';
    };
  };
}
