{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.ripgrep;
in
{
  options.custom.modules.ripgrep.enable = lib.mkEnableOption "Enable ripgrep";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      ripgrep
    ];
  };
}
