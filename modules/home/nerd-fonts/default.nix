{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.nerd-fonts;
in
{
  options.custom.modules.nerd-fonts = {
    enable = lib.mkEnableOption "Enable nerd-fonts";

    fonts = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      description = "List of nerd-fonts packages to install.";
      default = with pkgs.nerd-fonts; [
        jetbrains-mono
      ];
      example = [
        pkgs.nerd-fonts.jetbrains-mono
        pkgs.nerd-fonts.iosevka
      ];
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = lib.all (font: lib.elem font (builtins.attrValues pkgs.nerd-fonts)) cfg.fonts;
        message = "All entries in custom.modules.nerd-fonts.fonts must come from pkgs.nerd-fonts.";
      }
    ];

    fonts.fontconfig.enable = true;

    home.packages = cfg.fonts;
  };
}
