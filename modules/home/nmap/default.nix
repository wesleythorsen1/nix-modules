{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.nmap;
in
{
  options.custom.modules.nmap.enable = lib.mkEnableOption "Enable nmap";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nmap
    ];
  };
}
