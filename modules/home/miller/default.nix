{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.miller;
in
{
  options.custom.modules.miller.enable = lib.mkEnableOption "Enable miller";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      miller
    ];
  };
}
