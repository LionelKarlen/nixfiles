{
  den.aspects.glade = {
    nixos = {
      programs.niri = {
        enable = true;
      };
    };
  };
  den.aspects.lionel = {
    provides.glade = {
      homeManager =
        {
          lib,
          config,
          ...
        }:
        {
          xdg.configFile."noctalia/styles.toml".source = ../../../files/glade/noctalia/styles.toml;
          xdg.configFile."noctalia/theme.toml".source = ../../../files/glade/noctalia/theme.toml;
          xdg.configFile."noctalia/config.toml".source = ../../../files/glade/noctalia/config.toml;
          xdg.configFile."niri/config.kdl".source = ../../../files/glade/niri.kdl;
        };
    };
  };
}
