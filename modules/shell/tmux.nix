{
  den.aspects.shell = {
    homeManager = {
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

          set -g mouse on
          bind-key -T root WheelUpPane send-keys ""   # or ^Y
          bind-key -T root WheelDownPane send-keys "" # or ^E

          # vim mode copy
          setw -g mode-keys vi
          bind v copy-mode
          bind-key -T copy-mode-vi 'v' send -X begin-selection     # Begin selection in copy mode.
          bind-key -T copy-mode-vi 'C-v' send -X rectangle-toggle  # Begin selection in copy mode.
          bind-key -T copy-mode-vi 'y' send -X copy-selection      # Yank selection in copy mode.
          bind-key -T copy-mode-vi 'Escape' send -X cancel # exit out of copy mode

          # navigation
          bind -n M-1 selectw -t 1
          bind -n M-2 selectw -t 2
          bind -n M-3 selectw -t 3
          bind -n M-4 selectw -t 4
          bind -n M-5 selectw -t 5
          bind -n M-6 selectw -t 6
          bind -n M-7 selectw -t 7
        '';
      };
    };
  };
}
