{ config, pkgs, ... }:

{
  home.username = "laksith";
  home.homeDirectory = "/home/l/la/laksith";

  home.packages = with pkgs; [
    lsd
    ripgrep
    jetbrains.idea-community-bin
  ];

  programs.git = {
    enable = true;
    userName = "laksith19";
    userEmail = "admin@laksith.dev";

    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedsignersfile = "~/.ssh/allowed_signers";
      user.signingkey = "~/.ssh/id_ed25519.pub";
      init.defaultbranch = "main";
    };
  };

  home.file = {
    ".ssh".source = config.lib.file.mkOutOfStoreSymlink "/home/l/la/laksith/remote/.ssh/";
    ".config/home-manager".source = config.lib.file.mkOutOfStoreSymlink "/home/l/la/laksith/remote/.home-manager/";

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.05"; # Please read the comment before changing.
}
