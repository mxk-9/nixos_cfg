{ pkgs, ... }: let

  launchNet = pkgs.writeShellScriptBin "launch_virsh_net.sh" ''
    doas virsh net-start default 
  '';

  findGPUIOMMU = pkgs.writeShellScriptBin "find_gpu_iommu_groups.sh" ''
    shopt -s nullglob
    for g in $(find /sys/kernel/iommu_groups/* -maxdepth 0 -type d | sort -V); do
      echo "IOMMU Group ''${g##*/}:"
      for d in $g/devices/*; do
        echo -e "\t$(lspci -nns ''${d##*/})"
      done
    done
  '';
in {
  boot = {
    kernelParams = [
      "intel_iommu=on"
      "pcie_aspm=off" # I dunno 'bout this
    ];

    kernelModules = [ "vfio" "kvm-intel" ];

    initrd = {
      preDeviceCommands = ''
        DEVS="00:02.0"
        for DEV in $DEVS; do
          echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
        done
        modprobe -i vfio-pci
      '';

      availableKernelModules = [ "i915" "vfio-pci" ];
      };
    };

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      verbatimConfig = ''
        nvram = [ "${pkgs.OVMF}/FV/OVMF.fd:${pkgs.OVMF}/FV/OVMF_VARS.fd"]
      '';
      ovmf.enable = true;
    };
    onBoot = "ignore";
    onShutdown = "shutdown";
  };

  users.groups.libvirtd.members = [ "root" "sny" ];

  environment.systemPackages = [
    # Scripts
    launchNet
    findGPUIOMMU
  ] ++ (with pkgs; [
    # Apps
    virt-manager
    qemu
    OVMF
    virglrenderer
  ]);
}
