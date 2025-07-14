{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.augs.com.nixpkgs;
in
{
  options.augs.com.nixpkgs.enable = mkEnableOption "enable the base nixpkgs module";
  config = mkIf cfg.enable {
    nixpkgs = {
      hostPlatform = lib.mkDefault "x86_64-linux";
      config = {
        allowUnfree = lib.mkDefault false;
        allowUnfreePredicate =
          if config.augs.com.kernelDaily.enable then
            pkg:
            builtins.elem (lib.getName pkg) [
              "nvidia-x11"
              "nvidia-settings"
              "steam"
              "steam-unwrapped"
              "cuda_cudart"
              "libcublas"
              "cuda_cccl"
              "cuda_nvcc"
              "xow_dongle-firmware"
            ]
          else
            [ ];
      };
    };
  };
}
