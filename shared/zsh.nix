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
        e = "$EDITOR";
        c = ''$EDITOR -c "let g:open_yazi=v:true"'';
      };
      initContent = ''
        KEYTIMEOUT=10
      '';
    };
  };
}
