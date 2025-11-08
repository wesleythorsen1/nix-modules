{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.gnupg;
in
{
  options.custom.modules.gnupg.enable = lib.mkEnableOption "Enable gnupg";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gnupg
    ];
  };
}
