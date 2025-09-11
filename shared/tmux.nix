{
  config,
  lib,
  pkgs,
  ...
}:
let
  list_cmd = "sesh list -i | gum filter --limit 1 --no-sort --fuzzy";
in
{
  options = {
    tmux.enable = lib.mkEnableOption "enable tmux";
  };
  config = lib.mkIf config.tmux.enable {
    home.packages = with pkgs; [
      sesh
      gum
    ];
    programs.tmux = {
      enable = true;
      extraConfig = ''
        unbind-key -an
        unbind-key -a
        set -g default-terminal "tmux-256color"
        set -ga terminal-overrides ",*256col*:Tc"
        set -g set-clipboard on
        set -g escape-time 0

        set -g base-index 1
        set -g renumber-windows on
        set -g status-right ""
        set -g status-interval 1

        set -g window-status-format "#I: #W"
        set -g window-status-current-format "#I: #W"
        set -g status-left-length 200
        set-window-option -g window-status-current-style fg=blue,bright,bold

        set -g status-left "#{?client_prefix,#[bg=green] ,#[bg=blue] }#[bg=default] #{session_name} "

        # binds
        set -g prefix C-o
        bind t new-window -c "#{pane_current_path}"
        bind d detach
        bind r source-file ~/.config/tmux/tmux.conf
        bind q killp

        # vim mode copy
        set-window-option -g mode-keys vi
        bind -T copy-mode-vi 'v' send -X begin-selection
        # TODO: Update this with proper copy command
        # bind -T copy-mode-vi 'y' send -X copy-pipe-and-cancel ""
        unbind -T copy-mode-vi MouseDragEnd1Pane

        # navigation
        bind -n M-1 selectw -t 1
        bind -n M-2 selectw -t 2
        bind -n M-3 selectw -t 3
        bind -n M-4 selectw -t 4
        bind -n M-5 selectw -t 5
        bind -n M-6 electw -t 6
        bind -n M-7 selectw -t 7

        bind -n C-k display-popup -E -w 60% "sesh connect \"$(${list_cmd})\""
      '';
    };

    xdg.configFile."sesh/startup.sh".text = ''
      tmux new-window -d
      tmux send-keys -t 0 "c" Enter
    '';

    xdg.configFile."sesh/sesh.toml".text = ''
      [[session]]
      name = "nixfiles"
      path = "~/.glade/"

      [default_session]
      startup_command = "source ~/.config/sesh/startup.sh"

      [[window]]
      name = "nvim"
      startup_script="c"

      [[window]]
      name = "zsh"
      startup_script="ls"

      [[window]]
      name = "watch"
      startup_script="ls"
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
}
