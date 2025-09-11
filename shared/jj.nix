{
  lib,
  config,
  ...
}:
{
  options = {
    jj.enable = lib.mkEnableOption "enable jujutsu";
  };
  config = lib.mkIf config.jj.enable {
    programs.jujutsu = {
      enable = true;
      settings = {
        user = {
          name = "Lionel Karlen";
          email = "lionel.karlen@protonmail.com";
        };
        ui.default-command = "log";
      };
    };
  };
}
