{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false; # oh-my-zsh сам вызывает compinit — двух compinit не нужно, тормозит старт
    autosuggestion.enable = true;
    autocd = true;

    history.size = 10000;

    shellAliases = {
      # ...
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "dirhistory" "history" ];
      theme = "";  # без темы, промпт мой
    };

    syntaxHighlighting = {
      enable = true;
      styles = {
        # имя утилиты — белое, а не зелёное
        command           = "fg=white";
        builtin           = "fg=white";
        function          = "fg=white";
        alias             = "fg=white";
        "hashed-command"  = "fg=white";

        # существующие пути — голубые с подчёркиванием, как в fish
        path              = "fg=cyan,underline";
        path_prefix       = "fg=cyan,underline";
        autodirectory     = "fg=cyan,underline"; # директория как "голая команда" при autocd

        "commandseparator" = "fg=green"; # |, ;, &&, ||
      };
    };

    initContent = ''
      setopt PROMPT_SUBST
      autoload -Uz add-zsh-hook

      typeset -g _cmd_start=
      typeset -g _cmd_duration=

      _record_cmd_start() {
        _cmd_start=$SECONDS
      }
      add-zsh-hook preexec _record_cmd_start

      _record_cmd_duration() {
        local elapsed=0
        [[ -n "$_cmd_start" ]] && elapsed=$(( SECONDS - _cmd_start ))
        _cmd_start=

        if (( elapsed >= 5 )); then
          local h=$(( elapsed / 3600 ))
          local m=$(( (elapsed % 3600) / 60 ))
          local s=$(( elapsed % 60 ))
          if (( h > 0 )); then
            _cmd_duration="''${h}h''${m}m''${s}s"
          elif (( m > 0 )); then
            _cmd_duration="''${m}m''${s}s"
          else
            _cmd_duration="''${s}s"
          fi
        else
          _cmd_duration=
        fi
      }
      add-zsh-hook precmd _record_cmd_duration

      PROMPT='%F{white}[%f%F{green}%~%f%F{white}]%f %(#.%F{red}#%f.%F{white}$%f) '
      RPROMPT='%F{yellow}''${_cmd_duration}%f'
    '';
  };
}
