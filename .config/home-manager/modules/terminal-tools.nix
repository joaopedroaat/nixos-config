{
  pkgs,
  lib,
  config,
  ...
}: {
  options.terminal-tools.enable = lib.mkEnableOption "terminal-tools";
  config = lib.mkIf config.terminal-tools.enable {
    home.packages = with pkgs; [
      fzf
      libqalculate
    ];

    #######
    # FZF #
    #######
    programs.fish = {
      functions = {
        fish_user_key_bindings = {
          body =
            /*
            fish
            */
            ''
              if command -s fzf-share >/dev/null
                source (fzf-share)/key-bindings.fish
              end

              fzf_key_bindings
            '';
        };
      };
    };
  };
}
