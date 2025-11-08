{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.auth0-cli;
in
{
  options.custom.modules.auth0-cli.enable = lib.mkEnableOption "Enable auth0-cli";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      auth0-cli
    ];
  };
}
