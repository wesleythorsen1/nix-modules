{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.pipes-rs;
in
{
  options.custom.modules.pipes-rs.enable = lib.mkEnableOption "Enable pipes-rs";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      pipes-rs
    ];
  };
}
