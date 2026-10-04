{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Core CLI / VCS
    git ripgrep fd tree-sitter tree jq yq perl httpie

    # Build toolchain (C/C++)
    gcc

    # Python
    (python3.withPackages (ps: with ps; [
          python-lsp-server
          python-lsp-black
          black
        ]))
        pyright uv

    # typing
    klavaro

    #rustc # Добавить если надо
    #cargo
    #rust-analyzer
    #rustfmt
    #clippy

    #go
    #gopls
    #gotools
    #golangci-lint

    # JS / Java / Lua
    #nodejs
    #jdk maven gradle jdt-language-server
    #lua luajit luarocks lua-language-server stylua

    # Shell tooling
    bash-language-server shellcheck shfmt

    # Other language servers / formatters
    marksman yaml-language-server taplo sqls

    # Nix tooling
    statix nix-init deadnix nvd
    nix-output-monitor nix-tree nix-du
    nixd nil nixfmt

  ];
}
