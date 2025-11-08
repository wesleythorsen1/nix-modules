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

    ghq = {
      enable = lib.mkEnableOption "Configure ghq (repo management)";
      root = lib.mkOption {
        type = lib.types.str;
        default = "${config.home.homeDirectory}/repos";
        description = "ghq root directory";
      };
      useEnvVar = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Set GHQ_ROOT environment variable";
      };
    };

    gcd = {
      enable = lib.mkEnableOption "ghq + fzf picker (gcd + Ctrl+g)";
      key = lib.mkOption {
        type = lib.types.str;
        default = "^g";
        description = "Zsh keybinding for the gcd picker";
      };
      fzfOptions = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [
          "--height=50%"
          "--reverse"
          "--border"
        ];
        description = "Extra flags passed to fzf";
      };
      addCodeHelper = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Also add gcode (pick repo → open in VS Code)";
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

    programs.gh-dash = {
      enable = true;
      settings = {
        repoPaths = lib.mkIf cfg.ghq.enable [ cfg.ghq.root ];
      };
    };

    ghq = lib.mkIf cfg.ghq.enable {
      enable = true;
      root = cfg.ghq.root;
      useEnvVar = cfg.ghq.useEnvVar;
    };

    gcd = lib.mkIf cfg.gcd.enable {
      enable = true;
      key = cfg.gcd.key;
      fzfOptions = cfg.gcd.fzfOptions;
      addCodeHelper = cfg.gcd.addCodeHelper;
    };
  };
}
