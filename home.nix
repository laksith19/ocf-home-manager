{
  config,
  pkgs,
  ...
}: {
  home.username = "laksith";
  home.homeDirectory = "/home/l/la/laksith";

  home.packages = with pkgs; [
    lsd
    ripgrep
    jetbrains.idea-community-bin
  ];

  programs = {
    home-manager.enable = true;
    bash.enable = true;
    starship.enable = true;
    git = {
      enable = true;
      userName = "laksith19";
      userEmail = "admin@laksith.dev";

      extraConfig = {
        commit.gpgsign = true;
        gpg.format = "ssh";
        gpg.ssh.allowedsignersfile = "${toString config.home.homeDirectory}/.ssh/allowed_signers";
        user.signingkey = "${toString config.home.homeDirectory}/.ssh/id_ed25519.pub";
        init.defaultbranch = "main";
      };
    };
  };

  home.file = {
    ".ssh".source = config.lib.file.mkOutOfStoreSymlink "${toString config.home.homeDirectory}/remote/.ssh";
    ".config/home-manager".source = config.lib.file.mkOutOfStoreSymlink "${toString config.home.homeDirectory}/.config/desktop/home-manager";
    ".ssh/allowed_signers".text = lib.strings.concatStringsSep "\n" [
      "<admin@laksith.dev> ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6zftyMUeIQVYkRag6CxWqYShjWnErQ24NeaU95Bp2z laksith@quirrel"
      "<admin@laksith.dev> ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB1k8sWCp4/J+uw5RFHQ0UrVJpxK7fExlJlALNsHehs8 laksith@tsunami"
    ];
  };

  home.stateVersion = "24.05"; # Please read the comment before changing.
}
