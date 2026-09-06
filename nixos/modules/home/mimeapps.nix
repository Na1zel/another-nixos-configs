{ ... }:

{
  # ============================================================
  # MIME / Default apps
  # ============================================================

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/terminal" = "foot.desktop";

      "inode/directory" = "org.xfce.Thunar.desktop";

      "text/x-nix" = "org.kde.kate.desktop";
      "text/plain" = "org.kde.kate.desktop";
      "application/x-zerosize" = "org.kde.kate.desktop";
      "application/x-bak" = "org.kde.kate.desktop";

      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";

      "video/mp4" = "haruna.desktop";
      "video/x-matroska" = "haruna.desktop";
      "video/webm" = "haruna.desktop";
      "video/avi" = "haruna.desktop";
      "video/quicktime" = "haruna.desktop";

      "audio/mpeg"    = "elisa.desktop";
      "audio/flac"    = "elisa.desktop";
      "audio/ogg"     = "elisa.desktop";
      "audio/x-wav"   = "elisa.desktop";
      "audio/mp3"     = "elisa.desktop";
      "audio/aac"     = "elisa.desktop";
      "audio/x-aac"   = "elisa.desktop";
      "audio/x-mpegurl" = "elisa.desktop";
      "audio/x-scpls" = "elisa.desktop";

      "image/png" = "org.kde.gwenview.desktop";
      "image/jpeg" = "org.kde.gwenview.desktop";
      "image/gif" = "org.kde.gwenview.desktop";
      "image/webp" = "org.kde.gwenview.desktop";
      "image/svg+xml" = "org.kde.gwenview.desktop";
      "image/avif" = "org.kde.gwenview.desktop";
      "image/jxl" = "org.kde.gwenview.desktop";

      "application/pdf" = "org.kde.okular.desktop";

      "application/x-bittorrent" = "org.qbittorrent.qBittorrent.desktop";
      "application/x-torrent" = "org.qbittorrent.qBittorrent.desktop";
      "x-scheme-handler/magnet" = "org.qbittorrent.qBittorrent.desktop";

      "application/zip" = "org.kde.ark.desktop";
      "application/x-tar" = "org.kde.ark.desktop";
      "application/x-compressed-tar" = "org.kde.ark.desktop";
      "application/x-bzip2-compressed-tar" = "org.kde.ark.desktop";
      "application/x-xz-compressed-tar" = "org.kde.ark.desktop";
      "application/x-7z-compressed" = "org.kde.ark.desktop";
      "application/x-rar" = "org.kde.ark.desktop";
      "application/x-rar-compressed" = "org.kde.ark.desktop";
      "application/x-zstd-compressed-tar" = "org.kde.ark.desktop";

      "x-scheme-handler/mailto" = "org.kde.kmail2.desktop";
      "message/rfc822" = "org.kde.kmail2.desktop";
    };
  };
}
