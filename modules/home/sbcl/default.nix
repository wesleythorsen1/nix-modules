{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.sbcl;
in
{
  options.custom.modules.sbcl.enable = lib.mkEnableOption "Enable sbcl";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      sbcl
    ];
  };
}
