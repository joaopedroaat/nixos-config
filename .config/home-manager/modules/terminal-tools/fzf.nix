{
  lib,
  config,
  pkgs,
  ...
}: {
  options.fzf.enable = lib.mkEnableOption "Terminal tools";
  config = lib.mkIf config.fzf.enable {
    home.packages = with pkgs; [
      fzf
    ];

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
