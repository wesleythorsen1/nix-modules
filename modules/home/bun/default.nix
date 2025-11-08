{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.bun;
in
{
  options.custom.modules.bun.enable = lib.mkEnableOption "Enable bun";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      bun
    ];
  };
}
