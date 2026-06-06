{
  den.aspects.shell = {

    homeManager =
      { pkgs, ... }:
      let
        list_cmd = "sesh list -i | gum filter --limit 1 --no-sort --fuzzy";
      in
      {
        home.packages = with pkgs; [
          sesh
          gum
        ];

        xdg.configFile."sesh/startup.sh".text = ''
          tmux new-window -d
          tmux send-keys -t 0 "clear" Enter
        '';

        xdg.configFile."sesh/sesh.toml".text = ''
          [[session]]
          name = "nixfiles"
          path = "~/.nixfiles/"

          [default_session]
          startup_command = "source ~/.config/sesh/startup.sh"
        '';

        programs.zsh = {
          initContent = ''
            function sesh-sessions() {
              {
                exec </dev/tty
                exec <&1
                local session
                session=$(${list_cmd})
                zle reset-prompt > /dev/null 2>&1 || true
                [[ -z "$session" ]] && return
                sesh connect $session
              }
            }

            zle -N sesh-sessions
            bindkey "^k" sesh-sessions
            bindkey -M vicmd "^k" sesh-sessions
            bindkey -M viins "^k" sesh-sessions
          '';
        };
      };
  };
}
