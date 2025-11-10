{
  ...
}:

{
  # options.custom = {
  #   enable = lib.mkEnableOption "enable/disable all custom modules";
  # };

  imports = [
    ./auth0-cli
    ./awscli2
    ./bat
    ./bitwarden-cli
    ./btop
    ./bun
    ./burpsuite
    ./bws
    ./claude-code
    ./davinci-resolve
    ./dbeaver-bin
    ./deno
    ./docker
    ./doppler
    ./dotnet
    ./eza
    ./fastfetch
    ./fd
    ./ffmpeg_6-headless
    ./fontconfig
    ./fzf
    ./getoptions
    ./gh
    ./git
    ./gnupg
    ./golang
    ./goose-cli
    ./jq
    ./jwt-cli
    ./kubernetes-helm
    ./miller
    ./mysql80
    ./nerd-fonts
    ./ngrok
    ./nix-tree
    ./nixd
    ./nixfmt-rfc-style
    ./nmap
    ./pbfmt
    ./pipes-rs
    ./pnpm
    ./podman
    ./postman
    ./ripgrep
    ./rsclock
    ./sbcl
    ./sd
    ./slack
    ./terraform
    ./watch
    ./wget
    ./yank
    ./zip
    ./zulu24
  ];

  # Optional: global on/off gate
  # config = lib.mkIf config.custom.enable { };
}
