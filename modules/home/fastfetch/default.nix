{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.fastfetch;
in
{
  options.custom.modules.fastfetch.enable = lib.mkEnableOption "Enable fastfetch";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      fastfetch
    ];
  };
}
