{
  lib,
  config,
  ...
}:
{
  imports = [
    ./bluetooth.nix
    ./disk.nix
    ./keyboard.nix
    ./firmware.nix
    ./graphics.nix
    ./networking
    ./system.nix
    ./virtualisation.nix
  ];

  options.facter = with lib; {
    report = mkOption {
      type = types.raw;
      default = if config.facter.reportPath == null then {} else builtins.fromJSON (builtins.readFile config.facter.reportPath);
      description = "An import for the reportPath.";
    };

    reportPath = mkOption {
      type = types.nullOr types.path;
      default = null;
      description = "Path to a report generated by nixos-facter.";
    };
  };
}
