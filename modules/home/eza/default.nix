{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.eza;
in
{
  options.custom.modules.eza.enable = lib.mkEnableOption "Enable eza";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      eza
    ];
  };
}
