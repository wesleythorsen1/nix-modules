{
  lib,
  config,
  pkgs,
}:

let
  cfg = config.custom.modules.golang;
in
{
  options.custom.modules.golang = {
    enable = lib.mkEnableOption "Enable golang";

    package = lib.mkPackageOption pkgs "go" {
      default = pkgs.go;
      example = "pkgs.go";
    };
  };

  config = lib.mkIf cfg.enable {
    # add required golang base packages and user override-able golang package to the home manager packages
    home.packages =
      with pkgs;
      [
        clang
        libtool
        makeWrapper
      ]
      ++ cfg.package;
  };
}
