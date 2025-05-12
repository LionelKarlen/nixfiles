{...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      la = "ls -a";
      hms = "home-manager switch --flake /home/$(whoami)/.$(hostname)/";
      e = "$EDITOR";
      c = "$EDITOR";
    };
    initExtra = ''
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
    '';
  };
}
