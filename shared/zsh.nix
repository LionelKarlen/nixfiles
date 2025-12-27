{ config, lib, ... }:
{
  options = {
    zsh.enable = lib.mkEnableOption "enable zsh";
  };
  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      shellAliases = {
        hms = "home-manager switch --flake /home/$(whoami)/.$(hostname)/";
        org = "$EDITOR ~/org/tasks.todo.txt";
        vault = "$EDITOR ~/vault";
        e = "$EDITOR";
        c = ''$EDITOR -c ":Yazi"'';
      };
      initContent = ''
        KEYTIMEOUT=10
      '';
    };
  };
}
