{ ... }:

{
  # ============================================================
  # Vim
  # ============================================================

  programs.vim = {
    enable = true;

    extraConfig = ''
      highlight MatchParen ctermbg=white ctermfg=black guibg=white guifg=black

      set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
    '';
  };
}
