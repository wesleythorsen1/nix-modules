{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.golang;
in
{
  options.custom.modules.golang = {
    enable = lib.mkEnableOption "Enable golang";
    package = lib.mkPackageOption pkgs "go" { };
  };

  config = lib.mkIf cfg.enable {
    # add required golang base packages and user override-able golang package to the home manager packages
    home.packages = [
      pkgs.clang
      pkgs.libtool
      pkgs.makeWrapper
      cfg.package
    ];
  };
}
