{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    mouse = true;
    baseIndex = 1;
    clock24 = true;

    extraConfig = ''
      # Shift Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window

      # Visual mode keybind to act like vim
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi S-v send-keys -X rectangle-toggle

      # Create new session with C-n
      bind C-n command-prompt -p "New Session:" "new-session -A -s '%%'"

      # Open panes in current directory
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
    '';

    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
      tmuxPlugins.open
      tmuxPlugins.sensible
      tmuxPlugins.better-mouse-mode
      {
        plugin = tmuxPlugins.gruvbox;
        extraConfig = ''
          set -g @tmux-gruvbox 'dark' # or 'light'
        '';
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          # Restore nvim sessions
          set -g @resurrect-strategy-nvim 'session'
        '';
      }
    ];
  };
}
