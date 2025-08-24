# Ansible Collection - homelab_ops.raspberry_pi

![raspberry_pi](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-raspberry_pi.yaml/badge.svg)

A collection for managing Raspberry Pi devices and their configurations. This collection handles device provisioning and kernel configuration.

## Roles

| Role | Description |
| --- | --- |
| [homelab_ops.raspberry_pi.kernel_cmdline](roles/kernel_cmdline/) | Configures the kernel command line (`cmdline.txt`) of a Raspberry Pi device. |
| [homelab_ops.raspberry_pi.kernel_config](roles/kernel_config/) | Creates the kernel `config.txt` file for a Raspberry Pi device. |
| [homelab_ops.raspberry_pi.provision](roles/provision/) [DEPRECATED] | [DEPRECATED] Provisions a Raspberry Pi device by selecting a block device based on given criteria, creating partitions and filesystems if the block device is empty, configuring bind mounts, unpacking an OS image onto the root filesystem, configuring cloud-init userdata and Ansible playbooks to be invoked by cloud-init on first boot, and configuring the device for booting. This role is deprecated and will be removed in version 2.0.0. Use the underlying collections directly for better granular control. |

## Usage

To use the roles in this collection, include them in your playbooks:

```yaml
- hosts: raspberry_pis
  roles:
    - role: homelab_ops.raspberry_pi.kernel_cmdline
      vars:
        boot_path: /boot/firmware
        ubuntu_distribution_release: jammy
        root_filesystem:
          uuid: "{{ root_partition_uuid }}"
          fstype: ext4
          partlabel: writable
          name: /dev/mmcblk0p2

    - role: homelab_ops.raspberry_pi.kernel_config
      vars:
        kernel:
          config:
            disabled_features:
              - bluetooth
              - wifi
              - act_led
            autodetect:
              - display
          filename: vmlinux

    - role: homelab_ops.raspberry_pi.provision
      vars:
        provision:
          block_device:
            additional_bind_mounts:
              - src: /srv/longhorn
                target: /var/lib/longhorn
            partitions:
              boot:
                size: 256
              root:
                size: 4096
                filesystem_type: ext4
            root_mount_point: /mnt/root
            selector:
              include:
                type: mmc
                path: /dev/mmcblk0
            size_unit: MiB
          os_image:
            url: "https://cdimage.ubuntu.com/releases/22.04/release/ubuntu-22.04-preinstalled-server-arm64+raspi.img.xz"
            distribution_release: jammy
          raspberry_pi:
            serial: '10000000abcdef'
            kernel:
              config:
                arm_boost_supported: true
                disabled_features:
                  - bluetooth
                  - wifi
          cloudinit:
            ssh_users:
              - name: myuser
                authorized_keys:
                  - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKg+VLNODvNasN+qJYnSdRdw4X/rhZ9Wfn3BzSRVTn2W myuser@example.com
            runcmd_commands:
              - "[timedatectl, set-ntp, 'true']"
```

See each role's README for more detailed usage instructions and examples.

## Requirements

- Ansible 2.18 or newer
- The roles in this collection must be run as root
- The target device must be a Raspberry Pi running a supported operating system (e.g., Raspberry Pi OS, Ubuntu)

## License

AGPL-3.0-only

## Author Information

This collection was created by the homelab-ops team.
