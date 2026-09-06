{ ... }:

{
  # ============================================================
  # Fish shell
  # ============================================================

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      # Empty greeting
      set -g fish_greeting

      # Direnv
      if command -q direnv
        direnv hook fish | source
      end

      # Zoxide
      if command -q zoxide
        zoxide init fish --cmd cd | source
      end

      # Better ls
      if command -q eza
        alias ls='eza --icons --group-directories-first -1'
      end

      # Caelestia colours
      cat ~/.local/state/caelestia/sequences.txt 2>/dev/null

      # Foot terminal prompt markers
      function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
      end

      # Caelestia custom config
      set -q XDG_CONFIG_HOME
        and set -l cConf $XDG_CONFIG_HOME/caelestia
        or set -l cConf $HOME/.config/caelestia

      source $cConf/user-config.fish 2>/dev/null
    '';

    shellAbbrs = {
      # Git
      lg = "lazygit";
      gd = "git diff";
      ga = "git add .";
      gc = "git commit -am";
      gl = "git log";
      gs = "git status";
      gst = "git stash";
      gsp = "git stash pop";
      gp = "git push";
      gpl = "git pull";
      gsw = "git switch";
      gsm = "git switch main";
      gb = "git branch";
      gbd = "git branch -d";
      gco = "git checkout";
      gsh = "git show";

      # ls
      l = "ls";
      ll = "ls -l";
      la = "ls -a";
      lla = "ls -la";
    };

    functions = {
      fish_prompt = ''
        echo -n '['
        set_color $fish_color_cwd
        echo -n (prompt_pwd)
        set_color normal
        echo -n '] '

        if test (id -u) -eq 0
          set_color red
          echo -n '#'
        else
          set_color white
          echo -n '$'
        end

        set_color normal
        echo -n ' '
      '';
    };
  };
}
