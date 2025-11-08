{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.yank;
in
{
  options.custom.modules.yank.enable = lib.mkEnableOption "Enable yank";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      yank
    ];
  };
}
