{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.gh;
in
{
  imports = [
    ./gcd
    ./ghq
  ];

  options.custom.modules.gh = {
    enable = lib.mkEnableOption "Enable gh cli app";

    extensions = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = "List of gh extensions to install";
      example = [ pkgs.gh-eco ];
    };

    settings = lib.mkOption {
      type = lib.types.attrs;
      description = "Additional gh configuration settings";
      default = {
        git_protocol = "https";
        editor = "nvim";
        prompt = "enabled";
        prefer_editor_prompt = "disabled";
      };
      example = {
        git_protocol = "https";
        editor = "code --wait";
        aliases = {
          pv = "pr view";
          pc = "pr create";
        };
      };
    };

    aliases = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = { };
      description = "Git aliases for gh";
      example = {
        pv = "pr view";
        pc = "pr create";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.gh = {
      enable = true;
      extensions = cfg.extensions;
      settings = lib.mkMerge [
        {
          git_protocol = lib.mkDefault "https";
          editor = lib.mkDefault "nvim";
          prompt = lib.mkDefault "enabled";
          prefer_editor_prompt = lib.mkDefault "disabled";
          aliases = cfg.aliases;
        }
        cfg.settings
      ];
    };
  };
}
