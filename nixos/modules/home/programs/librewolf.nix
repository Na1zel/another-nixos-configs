{ ... }:

{
  # ============================================================
  # LibreWolf
  # ============================================================

  programs.librewolf = {
    enable = true;
    configPath = ".librewolf";

    profiles.naizel = {
      bookmarks = {
        force = true;
        settings = [
          {
            name = "Video Speed";
            toolbar = true;
            bookmarks = [
              { name = "1x"; url = "javascript:void(document.querySelector('video').playbackRate=1);"; }
              { name = "2x"; url = "javascript:void(document.querySelector('video').playbackRate=2);"; }
              { name = "3x"; url = "javascript:void(document.querySelector('video').playbackRate=3);"; }
              { name = "4x"; url = "javascript:void(document.querySelector('video').playbackRate=4);"; }
              { name = "5x"; url = "javascript:void(document.querySelector('video').playbackRate=5);"; }
              { name = "6x"; url = "javascript:void(document.querySelector('video').playbackRate=6);"; }
            ];
          }

          {
            name = "NixOS";
            toolbar = true;
            bookmarks = [
              { name = "NixOS Wiki";           url = "https://nixos.wiki/"; }
              { name = "NixOS Search";         url = "https://search.nixos.org/packages"; }
              { name = "Home Manager Options"; url = "https://home-manager-options.extranix.com/"; }
              { name = "NixOS Manual";         url = "https://nixos.org/manual/nixos/stable/"; }
              { name = "Home Manager Manual";  url = "https://nix-community.github.io/home-manager/"; }
              { name = "MyNixOS";              url = "https://mynixos.com/"; }
              { name = "Noogle";               url = "https://noogle.dev/"; }
            ];
          }

          {
            name = "Gaming";
            toolbar = true;
            bookmarks = [
              { name = "ProtonDB";             url = "https://www.protondb.com/"; }
              { name = "SteamDB";              url = "https://steamdb.info/"; }
              { name = "PCGamingWiki";         url = "https://www.pcgamingwiki.com/"; }
              { name = "GamingOnLinux";        url = "https://www.gamingonlinux.com/"; }
              { name = "Lutris";               url = "https://lutris.net/"; }
              { name = "Heroic";               url = "https://heroicgameslauncher.com/"; }
              { name = "Flathub";              url = "https://flathub.org/"; }
              { name = "OpenGameArt";          url = "https://opengameart.org/"; }
              { name = "AreWeAntiCheatYet";    url = "https://areweanticheatyet.com/"; }
              { name = "Modrinth";             url = "https://modrinth.com/"; }
              { name = "NewGrounds";           url = "https://www.newgrounds.com/"; }
            ];
          }

          {
           name = "PoE1";
           toolbar = true;
           bookmarks = [
             { name = "Youtube-Fubgan-Winter-Orb-2.29-Build";              url = "https://www.youtube.com/watch?v=W0AnGpWnSFM"; }
             { name = "Leveling-Winter-Orb-2.29";                          url = "https://pobb.in/J6Pf3nkrUY0Z"; }
             { name = "Endgame-Winter-Orb-2.29";                           url = "https://pobb.in/7K2DlBxbwoeZ"; }
             { name = "MobalysticWrittenGuide-Winter-Orb-2.29";            url = "https://mobalytics.gg/poe/builds/fubgun-winter-orb-elementalist"; }
             { name = "Youtube-BetterGuide-ronarray-Winter-Orb-2.29";      url = "https://youtu.be/yn1MzoinnUw"; }
             { name = "POB-Guide-Winter-Orb-2.29";                         url = "https://mobalytics.gg/poe/builds/winter-orb-occultist-witch-build-league-starter-to-endgame"; }
           ];
         }

         {
          name = "Music";
          toolbar = true;
          bookmarks = [
            { name = "Khinsider";        url = "https://downloads.khinsider.com/"; }
            { name = "Monochrome";       url = "https://monochrome.tf/"; }
            { name = "Lucida";           url = "https://lucida.to/"; }
            { name = "Cobalt";           url = "https://cobalt.tools/"; }
            { name = "Arcod";            url = "https://arcod.xyz/"; }
          ];
         }

         {
          name = "GithubProjects";
          toolbar = true;
          bookmarks = [
            { name = "GuideForEverething";            url = "https://github.com/fmhy/FMHY/wiki"; }
          ];
         }

         {
          name = "LinuxDistros";
          toolbar = true;
          bookmarks = [
            { name = "GentooLinux";       url = "https://www.gentoo.org/"; }
            { name = "VoidLinux";         url = "https://voidlinux.org/"; }
            { name = "ArchLinux";         url = "https://archlinux.org/"; }
            { name = "FreeBSD";           url = "https://www.freebsd.org/"; }
            { name = "NixOS";             url = "https://nixos.org/"; }
          ];
         }

          {
            name = "Other";
            toolbar = true;
            bookmarks = [
              { name = "Internet-Archive";  url = "https://archive.org/"; }
              { name = "Aero-Wallpapers";   url = "https://frutigeraeroarchive.org/"; }
              { name = "Wallhaven";         url = "https://wallhaven.cc/"; }
              { name = "Sacenao";           url = "https://saucenao.com/"; }
              { name = "WallpaperCave";     url = "https://wallpapercave.com/"; }
              { name = "DOTABUFF";          url = "https://ru.dotabuff.com/"; }
              { name = "LOR";               url = "https://www.linux.org.ru/"; }
              { name = "Pingvinus";         url = "https://pingvinus.ru/"; }
              { name = "NeoLurk";           url = "https://neolurk.org/"; }
              { name = "2chan";             url = "https://2ch.org/"; }
              { name = "4chan";             url = "https://4chan.org/"; }
              { name = "8chan";             url = "https://8chan.moe/"; }
              { name = "8kun";              url = "https://8kun.top/"; }
              { name = "64chan";            url = "https://64chan.net/"; }
              { name = "UrbanDictionary";   url = "https://www.urbandictionary.com/"; }
              { name = "Spacehey";          url = "https://spacehey.com/"; }
              { name = "Rutracker";         url = "https://rutracker.org/"; }
              { name = "FitGirl";           url = "https://fitgirl-repacks.site/"; }
              { name = "Reddit";            url = "https://www.reddit.com/"; }
              { name = "JoyReactor";        url = "https://joyreactor.cc/"; }
              { name = "Squidwtf";          url = "https://squid.wtf/"; }
              { name = "DanBooru";          url = "https://danbooru.donmai.us/"; }
              { name = "TerminalTrove";     url = "https://terminaltrove.com/"; }
            ];
          }
        ];
      };

      settings = {
        "browser.uidensity"                       = 1;
        "full-screen-api.warning.timeout"         = 0;
        "browser.translations.automaticallyPopup" = false;
      };
    };
  };
}
