{
  pkgs,
  lib,
  config,
  ...
}: let
  firefoxConfigDir = ".mozilla/firefox/joaopedroaat";
in {
  options.firefox.enable = lib.mkEnableOption "Firefox";
  config = lib.mkIf config.firefox.enable {
    home.file."${firefoxConfigDir}/chrome/userChrome.css".source = ./assets/userChrome.css;
    home.file."${firefoxConfigDir}/chrome/userColors.css".source = ./assets/userColors.css;
    home.file."${firefoxConfigDir}/chrome/userContent.css".source = ./assets/userContent.css;
    home.file."${firefoxConfigDir}/chrome/add.svg".source = ./assets/add.svg;
    home.file."${firefoxConfigDir}/chrome/left-arrow.svg".source = ./assets/left-arrow.svg;
    home.file."${firefoxConfigDir}/chrome/right-arrow.svg".source = ./assets/right-arrow.svg;

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
          force = true;
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
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
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
      };
    };
  };
}
