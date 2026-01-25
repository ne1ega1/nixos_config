{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 8200 ];
    allowedUDPPorts = [ 1900 ];
    interfaces."docker0".allowedTCPPorts = [ 53 ];
    interfaces."docker0".allowedUDPPorts = [ 53 ];
    extraCommands = ''
      iptables -I nixos-fw 1 -i br+ -p tcp -d 172.17.0.1 --dport 53 -j ACCEPT
      iptables -I nixos-fw 1 -i br+ -p udp -d 172.17.0.1 --dport 53 -j ACCEPT
    '';
  };
}
