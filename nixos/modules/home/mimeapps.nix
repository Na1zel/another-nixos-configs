{ ... }:

{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # Terminal
      "x-scheme-handler/terminal" = "Alacritty.desktop";

      # File manager
      "inode/directory" = "org.xfce.Thunar.desktop";

      # Text
      "text/x-nix" = "org.kde.kate.desktop";
      "text/plain" = "org.kde.kate.desktop";
      "application/x-zerosize" = "org.kde.kate.desktop";
      "application/x-bak" = "org.kde.kate.desktop";

      # Web
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";

      # Video
      "video/mp4" = "haruna.desktop";
      "video/x-matroska" = "haruna.desktop";
      "video/webm" = "haruna.desktop";
      "video/avi" = "haruna.desktop";
      "video/quicktime" = "haruna.desktop";

      # Audio
      "audio/mpeg" = "elisa.desktop";
      "audio/flac" = "elisa.desktop";
      "audio/ogg" = "elisa.desktop";
      "audio/x-wav" = "elisa.desktop";
      "audio/mp3" = "elisa.desktop";
      "audio/aac" = "elisa.desktop";
      "audio/x-aac" = "elisa.desktop";
      "audio/x-mpegurl" = "elisa.desktop";
      "audio/x-scpls" = "elisa.desktop";

      # Images
      "image/png" = "org.kde.gwenview.desktop";
      "image/jpeg" = "org.kde.gwenview.desktop";
      "image/gif" = "org.kde.gwenview.desktop";
      "image/webp" = "org.kde.gwenview.desktop";
      "image/svg+xml" = "org.kde.gwenview.desktop";
      "image/avif" = "org.kde.gwenview.desktop";
      "image/jxl" = "org.kde.gwenview.desktop";

      # Documents
      "application/pdf" = "org.kde.okular.desktop";

      # Torrents
      "application/x-bittorrent" = "org.kde.ktorrent.desktop";
      "application/x-torrent" = "org.kde.ktorrent.desktop";
      "x-scheme-handler/magnet" = "org.kde.ktorrent.desktop";

      # Archives
      "application/zip" = "org.kde.ark.desktop";
      "application/x-tar" = "org.kde.ark.desktop";
      "application/x-compressed-tar" = "org.kde.ark.desktop";
      "application/x-bzip2-compressed-tar" = "org.kde.ark.desktop";
      "application/x-xz-compressed-tar" = "org.kde.ark.desktop";
      "application/x-7z-compressed" = "org.kde.ark.desktop";
      "application/x-rar" = "org.kde.ark.desktop";
      "application/x-rar-compressed" = "org.kde.ark.desktop";
      "application/x-zstd-compressed-tar" = "org.kde.ark.desktop";

      # Mail
      "x-scheme-handler/mailto" = "org.kde.kmail2.desktop";
      "message/rfc822" = "org.kde.kmail2.desktop";
    };
  };

  # Default terminal

  xdg.terminal-exec = {
    enable = true;

    settings = {
      default = [
        "Alacritty.desktop"
      ];
    };
  };
}
