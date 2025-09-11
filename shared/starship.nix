{
  lib,
  config,
  ...
}:
{
  options = {
    starship.enable = lib.mkEnableOption "enable starship";
  };

  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        character = {
          success_symbol = "[->](bold green)";
          error_symbol = "[->](bold red)";
          vimcmd_symbol = "[<-](bold blue)";
        };
        hostname = {
          disabled = true;
        };
      };
    };
  };
}
