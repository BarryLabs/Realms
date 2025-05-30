{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.augs.net.service.mailserver.mamot;
in {
  imports = [
    (builtins.fetchTarball {
      url = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/nixos-24.11/nixos-mailserver-nixos-24.11.tar.gz";
      # To get the sha256 of the nixos-mailserver tarball, we can use the nix-prefetch-url command:
      # release="nixos-24.11"; nix-prefetch-url "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/${release}/nixos-mailserver-${release}.tar.gz" --unpack
      sha256 = "0000000000000000000000000000000000000000000000000000";
    })
  ];
  options.augs.net.service.mailserver.mamot.enable = mkEnableOption "enable nixos-mailserver for mamot.cc";
  config = mkIf cfg.enable {
    mailserver = {
      enable = true;
      fqdn = "mail.mamot.cc";
      domains = ["mamot.cc"];
      # A list of all login accounts. To create the password hashes, use
      # nix-shell -p mkpasswd --run 'mkpasswd -sm bcrypt'
      loginAccounts = {
        "chandler@mamot.cc" = {
          aliases = ["postmaster@example.com"];
          hashedPasswordFile = "/a/file/containing/a/hashed/password";
        };
      };
      certificateScheme = "acme-nginx";
    };
    security.acme.acceptTerms = true;
    security.acme.defaults.email = "security@mamot.cc";
  };
}
