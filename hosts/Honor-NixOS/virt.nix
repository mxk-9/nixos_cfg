{ config, pkgs, ... }: let
  findGPUIOMMU = pkgs.writeShellScriptBin "find_gpu_iommu_groups" ''
    shopt -s nullglob
    for g in $(find /sys/kernel/iommu_groups/* -maxdepth 0 -type d | sort -V); do
      echo "IOMMU Group ''${g##*/}:"
      for d in $g/devices/*; do
        echo -e "\t$(lspci -nns ''${d##*/})"
      done
    done
  '';

  iommuGroupsValidation = pkgs.writeShellScriptBin "ensuring_iommu_groups_are_valid" ''
    shopt -s nullglob
    for d in /sys/kernel/iommu_groups/*/devices/*; do
      n="''${d#*/iommu_groups/*}"
      n="''${n%%/*}"
      printf 'IOMMU Group %s \t' "$n"
      ${pkgs.pciutils}/bin/lspci -nns "''${d##*/}"
    done | sort -h -k 3
  '';

  genGVTTypes = pkgs.writeShellScriptBin "get_gvt_types" ''
    echo You should restart PC before running this script
    GVT_PCI=$(lspci -D -nn | grep -iE graphic | cut -f 1 -d ' ')
    GVT_GUID="911ca7bf-5e8b-47e6-b475-ba81b9591a05"
    GVT_TYPE="i915-GVTg_V5_4"
    # GVT_TYPE="i915-GVTg_V5_8"

    echo "Supported types:"
    ls /sys/devices/pci0000\:00/$GVT_PCI/mdev_supported_types

    echo -ne "\n\n$GVT_TYPE:\n"
    cat /sys/devices/pci0000\:00/$GVT_PCI/mdev_supported_types/$GVT_TYPE/description
  '';
  
  createGVTGUID = pkgs.writeShellScriptBin "create_gvt_guid" ''
    GVT_PCI=$(lspci -D -nn | grep -iE graphic | cut -f 1 -d ' ')
    GVT_GUID="911ca7bf-5e8b-47e6-b475-ba81b9591a05"
    GVT_TYPE="i915-GVTg_V5_4"

    echo "$GVT_GUID" > "/sys/devices/pci0000\:00/$GVT_PCI/mdev_supported_types/$GVT_TYPE/create"
  '';

  removeGVTGUID = pkgs.writeShellScriptBin "remove_gvt_guid" ''
    GVT_PCI=$(lspci -D -nn | grep -iE graphic | cut -f 1 -d ' ')
    GVT_GUID="911ca7bf-5e8b-47e6-b475-ba81b9591a05"

    echo 1 > /sys/devices/pci0000\:00/$GVT_PCI/$GVT_GUID/remove
  '';

  id1 = "";
  id2 = "";
in {
  boot = {
    kernelParams = [ "intel_iommu=on" "enable_gvt=1" "i915.enable_gvt=1" "i915.enable_guc=0" ];
    kernelModules = [ "vfio" "kvmgt" "mdev" "vfio_iommu_type1" "vfio_pci" "vfio_virqfd" ];
    # extraModprobeConfig = "options vfio-pci ids=${id1},${id2}";
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      verbatimConfig = ''
        nvram = [ "${pkgs.OVMF}/FV/OVMF.fd:${pkgs.OVMF}/FV/OVMF_VARS.fd"]
        '';
    };
  };

  users.groups.libvirtd.members = [ "root" "sny" ];

  environment.systemPackages = [
    # Scripts
    findGPUIOMMU
    iommuGroupsValidation
    genGVTTypes
    createGVTGUID
    removeGVTGUID
  ] ++ (with pkgs; [
    # Apps
    virt-manager
    qemu
    OVMF
  ]);
}
