{
  pkgs,
  lib,
  config,
  ...
}: {
  options.firefox.enable = lib.mkEnableOption "Firefox";
  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;

      policies = {
        NoDefaultBookmarks = true;
      };

      profiles.joaopedroaat = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          vimium
          onepassword-password-manager
          adblocker-ultimate
          betterttv
          react-devtools
          darkreader
        ];

        search = {
          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@np"];
            };

            "NixOS Wiki" = {
              urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = ["@nw"];
            };
          };
        };
        settings = {};
        /*
        bookmarks = [
          {
            name = "Chat GPT";
            tags = ["Application" "Chat"];
            keyword = "GPT";
            url = "https://chatgpt.com";
          }
          {
            name = "Emails";
            toolbar = false;
            bookmarks = [
              {
                name = "Gmail (joaopedroaat)";
                tags = ["Email"];
                keyword = "Email";
                url = "https://mail.google.com/mail/u/0";
              }
              {
                name = "Outlook (joaopedroaat)";
                tags = ["Email"];
                keyword = "Email";
                url = "https://outlook.live.com/mail/0";
              }
            ];
          }
          {
            name = "Drives";
            toolbar = false;
            bookmarks = [
              {
                name = "iCloud";
                tags = ["Cloud" "Apple"];
                keyword = "iCloud";
                url = "https://www.icloud.com";
              }
              {
                name = "Google Drive";
                tags = ["Cloud" "Google"];
                keyword = "Google";
                url = "https://console.cloud.google.com/welcome";
              }
              {
                name = "OneDrive";
                tags = ["Cloud" "Microsoft"];
                keyword = "OneDrive";
                url = "https://onedrive.live.com";
              }
            ];
          }
          {
            name = "Accounts";
            toolbar = false;
            bookmarks = [
              {
                name = "Google";
                tags = ["Account" "Google"];
                keyword = "Google";
                url = "https://myaccount.google.com";
              }
              {
                name = "Microsoft";
                tags = ["Account" "Microsoft"];
                keyword = "Microsoft";
                url = "https://account.microsoft.com";
              }
              {
                name = "Apple";
                tags = ["Account" "Apple"];
                keyword = "Apple";
                url = "https://www.icloud.com";
              }
              {
                name = "Github";
                tags = ["Account" "Github"];
                keyword = "Github";
                url = "https://github.com/joaopedroaat";
              }
            ];
          }
          {
            name = "Design";
            toolbar = false;
            bookmarks = [
              {
                name = "Figma";
                tags = ["Application" "Design"];
                keyword = "Figma";
                url = "https://www.figma.com";
              }
              {
                name = "Rosé Pine";
                tags = ["Design" "Palette"];
                keyword = "Rosé";
                url = "https://rosepinetheme.com";
              }
            ];
          }
          {
            name = "Study";
            toolbar = false;
            bookmarks = [
              {
                name = "Neet Code";
                tags = ["Study" "Algorithms"];
                keyword = "NeetCode";
                url = "https://neetcode.io";
              }
            ];
          }
        ];
        */
        userChrome =
          /*
          css
          */
          ''
            :root {
              --uc-bg-color: #1f1d29;
              --uc-show-new-tab-button: none;
              --uc-show-tab-separators: none;
              --uc-tab-separators-color: none;
              --uc-tab-separators-width: none;
              --uc-tab-fg-color: #9bced7;
              --autocomplete-popup-background: var(--mff-bg) !important;
              --default-arrowpanel-background: var(--mff-bg) !important;
              --default-arrowpanel-color: #fefefa !important;
              --lwt-toolbarbutton-icon-fill: var(--mff-icon-color) !important;
              --panel-disabled-color: #f9f9fa80;
              --toolbar-bgcolor: var(--mff-bg) !important;
              --urlbar-separator-color: transparent !important;
              --mff-bg: #1f1d29;
              --mff-icon-color: #9bced7;
              --mff-nav-toolbar-padding: 8px;
              --mff-sidebar-bg: var(--mff-bg);
              --mff-sidebar-color: #f1ca93;
              --mff-tab-border-radius: 0px;
              --mff-tab-color: #ea6f91;
              --mff-tab-font-family: "FiraCode Nerd Font";
              --mff-tab-font-size: 11pt;
              --mff-tab-font-weight: 400;
              --mff-tab-height: 32px;
              --mff-tab-pinned-bg: #9bced7;
              --mff-tab-selected-bg: #403c58;
              --mff-tab-soundplaying-bg: #9c89b8;
              --mff-urlbar-color: #98c1d9;
              --mff-urlbar-focused-color: #403c58;
              --mff-urlbar-font-family: "Fira Code";
              --mff-urlbar-font-size: 11pt;
              --mff-urlbar-font-weight: 700;
              --mff-urlbar-results-color: #f1ca93;
              --mff-urlbar-results-font-family: "Fira Code";
              --mff-urlbar-results-font-size: 11pt;
              --mff-urlbar-results-font-weight: 700;
              --mff-urlbar-results-url-color: #98c1d9;
            }

            #fullscr-toggler {
              background-color: rgba(0, 0, 0, 0) !important;
            }

            #back-button > .toolbarbutton-icon {
              --backbutton-background: transparent !important;
              border: none !important;
            }

            #back-button {
              list-style-image: url("${./assets/left-arrow.svg}") !important;
            }

            #forward-button {
              list-style-image: url("${./assets/right-arrow.svg}") !important;
            }

            /* Options with pixel amounts could need to be adjusted, as this only works for my laptop's display */
            #titlebar {
              -moz-box-ordinal-group: 0 !important;
            }

            .tabbrowser-tab:not([fadein]),
            #tracking-protection-icon-container,
            #identity-box {
              display: none !important;
              border: none !important;
            }
            #urlbar-background,
            .titlebar-buttonbox-container,
            #nav-bar,
            .tabbrowser-tab:not([selected]) .tab-background {
              background: var(--uc-bg-color) !important;
              border: none !important;
            }
            #urlbar[breakout][breakout-extend] {
              top: calc(
                (var(--urlbar-toolbar-height) - var(--urlbar-height)) / 2
              ) !important;
              left: 0 !important;
              width: 100% !important;
            }

            #urlbar[breakout][breakout-extend] > #urlbar-input-container {
              height: var(--urlbar-height) !important;
              padding-block: 0 !important;
              padding-inline: 0 !important;
            }

            #urlbar[breakout][breakout-extend] > #urlbar-background {
              animation-name: none !important;
              box-shadow: none !important;
            }
            #urlbar-background {
              box-shadow: none !important;
            }
            /*#tabs-newtab-button {
              display: var(--uc-show-new-tab-button) !important;
            }*/
            .tabbrowser-tab::after {
              border-left: var(--uc-tab-separators-width) solid
                var(--uc-tab-separators-color) !important;
              display: var(--uc-show-tab-separators) !important;
            }
            .tabbrowser-tab[first-visible-tab][last-visible-tab] {
              background-color: var(--uc-bar-bg-color) !important;
            }
            .tab-close-button.close-icon {
              display: none !important;
            }
            .tabbrowser-tab:hover .tab-close-button.close-icon {
              display: block !important;
            }
            #urlbar-input {
              text-align: center !important;
            }
            #urlbar-input:focus {
              text-align: left !important;
            }
            #urlbar-container {
              margin-left: 3vw !important;
            }
            .tab-text.tab-label {
              color: var(--uc-tab-fg-color) !important;
            }
            #navigator-toolbox {
              border-bottom: 0px solid #ea6f91 !important;
              background: var(--uc-bg-color) !important;
            }

            .urlbar-icon > image {
              fill: var(--mff-icon-color) !important;
              color: var(--mff-icon-color) !important;
            }

            .toolbarbutton-text {
              color: var(--mff-icon-color) !important;
            }
            .urlbar-icon {
              color: var(--mff-icon-color) !important;
            }
          '';

        userContent =
          /*
          css
          */
          ''
            /*================ IMPORT COLORS ================*/
            @import "${./assets/userColors.css}";

            /*================== FIREFOX BG COLOR ==================*/
            @-moz-document url("about:newtab"), url("about:home"), url("about:blank"), url("about:support"), url("about:config") {
              /*Light*/
              html:not(#ublock0-epicker),
              html:not(#ublock0-epicker) body,
              #newtab-customize-overlay {
                background-color: var(--light_color1) !important;
              }
              html {
                --in-content-page-background: var(--light_color1) !important;
              }
              .wordmark {
                fill: #201841 !important;
              }
              .SnippetBaseContainer {
                background-color: var(--light_color2) !important;
                color: var(--other_color3) !important;
              }
              .ASRouterButton {
                border-radius: 3px !important;
              }
              /*Dark*/
              html:not(#ublock0-epicker)[lwt-newtab-brighttext],
              html:not(#ublock0-epicker) body[lwt-newtab-brighttext],
              #newtab-customize-overlay[lwt-newtab-brighttext] {
                background-color: var(--dark_color1) !important;
              }
              html[lwt-newtab-brighttext] {
                --in-content-page-background: var(--dark_color1) !important;
              }
              [lwt-newtab-brighttext] .wordmark {
                fill: #fefafe !important;
              }
              [lwt-newtab-brighttext] .SnippetBaseContainer {
                background-color: var(--dark_color2) !important;
                color: var(--word_color3) !important;
              }
              [lwt-newtab-brighttext] .ASRouterButton {
                border-radius: 3px !important;
              }
            }

            /*================== SEARCH BAR ==================*/
            /*Light*/
            .search-wrapper input {
              transition: all 0.3s ease !important;
              background: var(--light_color2) var(--newtab-search-icon) 12px center
                no-repeat !important;
              background-size: 20px !important;
              border: 1px solid !important;
              border-color: var(--light_color3) !important;
              box-shadow: none !important;
              color: var(--other_color3) !important;
            }
            /*Dark*/
            [lwt-newtab-brighttext] .search-wrapper input {
              transition: all 0.3s ease !important;
              background: var(--dark_color2) var(--newtab-search-icon) 12px center no-repeat !important;
              background-size: 20px !important;
              border: 1px solid !important;
              border-color: var(--dark_color3) !important;
              box-shadow: none !important;
              color: var(--word_color3) !important;
            }
            /*Light*/
            .search-wrapper .search-inner-wrapper:hover input,
            .search-wrapper .search-inner-wrapper:active input,
            .search-wrapper input:focus {
              border-color: var(--light_color4) !important;
            }
            /*Dark*/
            [lwt-newtab-brighttext] .search-wrapper .search-inner-wrapper:hover input,
            [lwt-newtab-brighttext] .search-wrapper .search-inner-wrapper:active input,
            [lwt-newtab-brighttext] .search-wrapper input:focus {
              border-color: var(--dark_color4) !important;
            }
            /*Light*/
            .search-wrapper .search-button,
            .search-wrapper .search-button {
              transition: all 0.3s ease !important;
              fill: var(--other_color3) !important;
            }
            /*Dark*/
            [lwt-newtab-brighttext] .search-wrapper .search-button,
            [lwt-newtab-brighttext] .search-wrapper .search-button {
              transition: all 0.3s ease !important;
              fill: var(--word_color3) !important;
            }
            /*Light*/
            .search-wrapper .search-button:focus,
            .search-wrapper .search-button:hover {
              background-color: var(--light_color4) !important;
            }
            /*Dark*/
            [lwt-newtab-brighttext] .search-wrapper .search-button:focus,
            [lwt-newtab-brighttext] .search-wrapper .search-button:hover {
              background-color: var(--dark_color4) !important;
            }

            /*================== READER VIEW ==================*/
            @-moz-document url-prefix("about:reader") {
              html {
                background: var(--base_color1);
              }
              toolbar > reader-toolbar {
                border-radius: 3px !important;
              }

              /*Dark*/
              body.loaded.dark {
                --toolbar-bgcolor: var(--dark_color2) !important;
                --toolbar-border: var(--dark_color1) !important;
                --toolbar-hover: var(--dark_color3) !important;
                --popup-bgcolor: var(--dark_color2) !important;
                --popup-border: var(--dark_color3) !important;
                --font-color: var(--word_color3) !important;
                --icon-fill: var(--word_color3) !important;
                background: var(--dark_color1) !important;
                --blue-40: var(--word_color1) !important;
                --blue-40-a30: rgba(144, 89, 255, 0.3) !important;
                --active-color: var(--word_color1) !important;
              }
              /*Light*/
              body.loaded.light {
                --toolbar-bgcolor: var(--light_color2) !important;
                --toolbar-border: var(--light_color1) !important;
                --toolbar-hover: var(--light_color3) !important;
                --popup-bgcolor: var(--light_color2) !important;
                --popup-border: var(--light_color3) !important;
                --font-color: var(--other_color3) !important;
                --icon-fill: var(--other_color3) !important;
                background: var(--light_color1) !important;
                --blue-40: var(--other_color1) !important;
                --blue-40-a30: rgba(51, 46, 86, 0.3) !important;
                --active-color: var(--other_color1) !important;
              }
              /*Sepia*/
              body.loaded.sepia {
                --toolbar-bgcolor: var(--light_color2) !important;
                --toolbar-border: var(--light_color1) !important;
                --toolbar-hover: var(--light_color3) !important;
                --popup-bgcolor: var(--light_color2) !important;
                --popup-border: var(--light_color3) !important;
                --font-color: var(--other_color3) !important;
                --icon-fill: var(--other_color3) !important;
                background: var(--light_color1) !important;
              }
            }
          '';
      };
    };
  };
}
