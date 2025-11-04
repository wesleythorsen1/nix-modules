{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.dotnet;
in
{
  options.custom.modules.dotnet = {
    enable = lib.mkEnableOption "Enable dotnet sdk";
    package = lib.mkPackageOption pkgs "dotnet-sdk_9" { };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      cfg.package
    ];
  };
}
