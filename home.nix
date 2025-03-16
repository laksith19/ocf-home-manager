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

    gh = {
      enable = true;
      gitCredentialHelper.hosts = [
        "https://github.com"
        "https://gist.github.com"
        "https://git.laksith.dev"
      ];

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
}
