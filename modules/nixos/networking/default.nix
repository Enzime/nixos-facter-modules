{ config, lib, ... }:
{
  imports = [
    ./broadcom.nix
    ./intel.nix
  ];

  options.facter.detected.dhcp.enable = lib.mkEnableOption "Facter dhcp module" // {
    default = builtins.length config.facter.report.hardware.network_interface or [ ] > 0;
  };
  config = lib.mkIf config.facter.detected.dhcp.enable {
    networking.useDHCP = lib.mkDefault true;
    networking.useNetworkd = lib.mkDefault true;
  };
}
