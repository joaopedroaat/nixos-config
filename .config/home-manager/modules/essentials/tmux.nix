{
  pkgs,
  lib,
  config,
  ...
}: {
  options.tmux.enable = lib.mkEnableOption "Tmux";
  config = lib.mkIf config.tmux.enable {
    # Needed to open nvim sessions, need to fix in the future!!!
    home.packages = with pkgs; [
      moreutils
    ];

    programs.tmux = {
      enable = true;
      keyMode = "vi";
      mouse = true;
      baseIndex = 1;
      clock24 = true;
      shell = "${pkgs.zsh}/bin/zsh";

      extraConfig = ''
        # Shift Alt vim keys to switch windows
        bind -n M-H previous-window
        bind -n M-L next-window

        # Visual mode keybind to act like vim
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi S-v send-keys -X rectangle-toggle

        # Create new session with C-n
        bind C-n command-prompt -p "New Session:" "new-session -A -s '%%' -c '~'"

        # Open panes in current directory
        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"

        # Open windows in current directory
        bind c new-window -c "#{pane_current_path}"
      '';

      plugins = with pkgs; [
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.yank
        tmuxPlugins.open
        tmuxPlugins.sensible
        tmuxPlugins.better-mouse-mode
        {
          plugin = tmuxPlugins.rose-pine;
          extraConfig = ''
            set -g @rose_pine_variant 'main' # Options are 'main', 'moon' or 'dawn'

            set -g @rose_pine_host 'on' # Enables hostname in the status bar
            set -g @rose_pine_date_time "" # It accepts the date UNIX command format (man date for info)
            set -g @rose_pine_user 'on' # Turn on the username component in the statusbar
            set -g @rose_pine_directory 'on' # Turn on the current folder component in the status bar
            set -g @rose_pine_bar_bg_disable 'on' # Disables background color, for transparent terminal emulators
            # If @rose_pine_bar_bg_disable is set to 'on', uses the provided value to set the background color
            # It can be any of the on tmux (named colors, 256-color set, `default` or hex colors)
            # See more on http://man.openbsd.org/OpenBSD-current/man1/tmux.1#STYLES
            set -g @rose_pine_bar_bg_disabled_color_option 'default'

            set -g @rose_pine_only_windows 'on' # Leaves only the window module, for max focus and space
            set -g @rose_pine_disable_active_window_menu 'on' # Disables the menu that shows the active window on the left

            set -g @rose_pine_default_window_behavior 'on' # Forces tmux default window list behaviour
            set -g @rose_pine_show_current_program 'on' # Forces tmux to show the current running program as window name
            set -g @rose_pine_show_pane_directory 'on' # Forces tmux to show the current directory as window name
            # Previously set -g @rose_pine_window_tabs_enabled

            # Example values for these can be:
            set -g @rose_pine_left_separator ' > ' # The strings to use as separators are 1-space padded
            set -g @rose_pine_right_separator ' < ' # Accepts both normal chars & nerdfont icons
            set -g @rose_pine_field_separator ' | ' # Again, 1-space padding, it updates with prefix + I
            set -g @rose_pine_window_separator ' - ' # Replaces the default `:` between the window number and name

            # These are not padded
            set -g @rose_pine_session_icon '' # Changes the default icon to the left of the session name
            set -g @rose_pine_current_window_icon '' # Changes the default icon to the left of the active window name
            set -g @rose_pine_folder_icon '' # Changes the default icon to the left of the current directory folder
            set -g @rose_pine_username_icon '' # Changes the default icon to the right of the hostname
            set -g @rose_pine_hostname_icon '󰒋' # Changes the default icon to the right of the hostname
            set -g @rose_pine_date_time_icon '󰃰' # Changes the default icon to the right of the date module
            set -g @rose_pine_window_status_separator "  " # Changes the default icon that appears between window names

            # Very beta and specific opt-in settings, tested on v3.2a, look at issue #10
            set -g @rose_pine_prioritize_windows 'on' # Disables the right side functionality in a certain window count / terminal width
            set -g @rose_pine_width_to_hide '80' # Specify a terminal width to toggle off most of the right side functionality
            set -g @rose_pine_window_count '5' # Specify a number of windows, if there are more than the number, do the same as width_to_hide
          '';
        }
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = ''
            resurrect_dir="$HOME/.tmux/resurrect"
            set -g @resurrect-dir $resurrect_dir
            set -g @resurrect-hook-post-save-all "sed 's/--cmd[^ ]* [^ ]* [^ ]*//g' $resurrect_dir/last | sponge $resurrect_dir/last"
            set -g @resurrect-processes '"~nvim"'
          '';
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            # Restore environment automatically
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '10'
          '';
        }
      ];
    };
  };
}
