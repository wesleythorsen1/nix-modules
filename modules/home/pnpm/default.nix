{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.pnpm;
in
{
  options.custom.modules.pnpm.enable = lib.mkEnableOption "Enable pnpm";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      pnpm
    ];
  };
}
