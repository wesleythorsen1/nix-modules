{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.dbeaver-bin;
in
{
  options.custom.modules.dbeaver-bin.enable = lib.mkEnableOption "Enable dbeaver-bin";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      dbeaver-bin
    ];
  };
}
