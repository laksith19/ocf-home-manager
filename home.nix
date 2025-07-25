{
  config,
  pkgs,
  lib,
  ...
}: {
  home = {
    username = "laksith";
    homeDirectory = "/home/l/la/laksith";

    packages = with pkgs; [
      lsd
      ripgrep
      jetbrains.idea-community-bin
    ];

    stateVersion = "24.05"; # Please read the comment before changing.
  };

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
        user.signingkey = "${toString config.home.homeDirectory}/.ssh/ed25519-sk.pub";
        init.defaultbranch = "main";
      };
    };
  };
}
