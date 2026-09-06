{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Scanning / diagnostics
    nmap zenmap netcat-gnu traceroute dig iw

    # Basic networking
    wget wget2 curl dnsmasq

    # VPN / Proxy
    openvpn openconnect wireguard-tools
    v2ray xray sing-box mihomo
    tor tor-browser proxychains-ng privoxy

  ];
}
