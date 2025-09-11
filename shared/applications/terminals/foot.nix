{
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.applications.terminals.foot.enable {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          term = "xterm-256color";
          pad = "10x10";
        };
      };
    };
  };
}
