{ ... }:

{
  services.flatpak.enable = true; # недекларативно: репозиторий добавить вручную: flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}
