{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.burpsuite;
in
{
  options.custom.modules.burpsuite.enable = lib.mkEnableOption "Enable burpsuite";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      burpsuite
    ];
  };
}
