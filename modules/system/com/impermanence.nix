{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.augs.com.impermanence;
in
{
  options.augs.com.impermanence.enable = mkEnableOption "enable base impermanence module";
  config = mkIf cfg.enable {
    fileSystems = {
      "/" = {
        device = "none";
        fsType = "tmpfs";
        options = [ "mode=755" ];
      };
      "/boot" = {
        device = "/dev/nvme0n1";
        fsType = "vfat";
      };
      "/nix" = {
        device = "/dev/nvme0n1";
        fsType = "ext4";
      };
      "/home/${config.var.user}" = {
        device = "/dev/nvme0n1";
        fsType = "ext4";
        options = [ "mode=777" ];
      };
    };
  };
}
