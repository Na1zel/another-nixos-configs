{ pkgs, ... }:

{
  # ============================================================
  # VSCodium
  # ============================================================

  programs.vscodium = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-ceintl.vscode-language-pack-ru
        jnoortheen.nix-ide
        rust-lang.rust-analyzer
        golang.go
        llvm-vs-code-extensions.vscode-clangd
        redhat.java
        redhat.vscode-yaml
        mads-hartmann.bash-ide-vscode
        tamasfe.even-better-toml
        sumneko.lua
        detachhead.basedpyright
        mkhl.direnv
        vscodevim.vim
      ];

      userSettings = {
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings"."nixd"."formatting"."command" = [ "nixfmt" ];

        "clangd.path" = "clangd";
      };
    };
  };

  xdg.configFile."VSCodium/argv.json" = {
    force = true;
    text = ''
      {
        "locale": "ru"
      }
    '';
  };
}
