{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.git;
in
{
  options.custom.modules.git = {
    enable = lib.mkEnableOption "Enable git";
    package = lib.mkPackageOption pkgs "git" { };

    settings = lib.mkOption {
      type = lib.types.attrs;
      default = {
        alias = {
          co = "checkout";
          loga = "log --oneline --graph --all"; # [l]og [o]ne-line [g]raph [a]ll
          logl = "log --oneline --graph --all"; # [l]og [o]ne-line [g]raph a[l]l
          logp = "log --oneline --graph --all --abbrev-commit --date=relative --pretty=format:'%C(auto)%h%Creset -%C(auto)%d%Creset %s %C(bold blue)<%an>%Creset %C(bold white)(%cr)'";
          pf = "push --force-with-lease"; # [p]ush [f]orce-with-lease
          aacane = "!git add -A && git commit --amend --no-edit"; # [a]dd [a]ll [c]ommit [a]mend [n]o-[e]dit
          bcu = "!f() { git branch -D \"$1\" && git branch -D --remote \"origin/$1\" && git push origin --delete \"$1\"; }; f"; # [b]ranch [c]lean [u]p
        };
        push = {
          autoSetupRemote = true;
        };
        core = {
          editor = "nvim";
          repositoryformatversion = 0;
          filemode = true;
          bare = false;
          logallrefupdates = true;
          ignorecase = false;
          precomposeunicode = true;
        };
        credential = {
          "https://github.com/".useHttpPath = true;
        };
        merge = {
          conflictstyle = "zdiff3";
        };
      };
    };

    user = {
      name = lib.mkOption {
        type = lib.types.str;
        description = "git.settings.user.name";
      };
      email = lib.mkOption {
        type = lib.types.str;
        description = "git.settings.user.email";
      };
      signingkey = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
        example = "ABCD1234ABCD1234";
      };
    };

    credentialHelper = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      description = "git.settings.credential.helper";
      default = null;
      example = "osxkeychain";
    };

    delta = {
      enable = lib.mkEnableOption "Enable git delta";
    };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      git = {
        enable = true;
        package = cfg.package;
        ignores = [
          ".DS_Store"
        ];
        settings = lib.mkMerge [
          (lib.optionalAttrs (cfg.user.signingkey != null) {
            user.signingkey = cfg.user.signingkey;
            commit.gpgsign = lib.mkDefault true; # auto enable if signing key specified
          })
          (lib.optionalAttrs (cfg.credentialHelper != null) {
            credential.helper = cfg.credentialHelper;
          })
          {
            # required
            user.name = cfg.user.name;
            user.email = cfg.user.email;
          }
          cfg.settings
        ];
      };

      delta = lib.mkIf cfg.delta.enable {
        enable = true;
        enableGitIntegration = true;
        options = {
          side-by-side = true;
          line-numbers = true;
        };
      };
    };
  };
}
