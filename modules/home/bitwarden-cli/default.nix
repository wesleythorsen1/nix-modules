{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.bitwarden-cli;
in
{
  options.custom.modules.bitwarden-cli.enable = lib.mkEnableOption "Enable bitwarden-cli";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      bitwarden-cli
    ];
  };
}
