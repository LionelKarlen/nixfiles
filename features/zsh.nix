{...}: {
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
  programs.zsh = {
    enable = true;
    shellAliases = {
      hms = "home-manager switch --flake /home/$(whoami)/.$(hostname)/";
      e = "$EDITOR";
      c = "$EDITOR -c \"let g:open_yazi=v:true\"";
    };
    initContent = ''
      autoload -Uz add-zsh-hook
        function change_tab_title() {
            local title=$1
            command nohup zellij action rename-tab $title >/dev/null 2>&1
        }

        function set_tab_to_command_line() {
            local cmdline=$1
            change_tab_title $cmdline
        }

        function zljr() {
            local title=$1
            command nohup zellij action rename-tab $title >/dev/null 2>&1
        }
        KEYTIMEOUT=10
    '';
  };
}
