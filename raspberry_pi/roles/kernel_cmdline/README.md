# homelab_ops.raspberry_pi.kernel_cmdline

A role that manages kernel boot parameters for Raspberry Pi devices. This role handles cmdline.txt configuration for system boot and root filesystem access.

This role manages boot configuration by:

1. Setting kernel parameters
2. Configuring root filesystem for the kernel

## Requirements

- Ansible 2.15 or newer
- This role must be run as root
- The target device must be a Raspberry Pi running a supported operating system (e.g., Raspberry Pi OS, Ubuntu)

## Role Variables

| Variable | Default | Description |
| --- | --- | --- |
| `boot_path` | undefined | The path to the boot partition where `cmdline.txt` is located |
| `ubuntu_distribution_release` | undefined | The Ubuntu distribution release (e.g., `focal`, `jammy`, `noble`) |
| `root_filesystem.uuid` | undefined | The UUID of the root filesystem partition |
| `root_filesystem.fstype` | undefined | The filesystem type of the root partition (e.g., `ext4`, `btrfs`) |
| `root_filesystem.partlabel` | undefined | The partition label of the root filesystem |
| `root_filesystem.name` | undefined | The device name of the root filesystem (e.g., `/dev/mmcblk0p2`) |

## Dependencies

None

## Example Playbook

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
```

See the [Molecule test playbook](../../molecule/kernel_cmdline/converge.yml) for a complete example.

## License

AGPL-3.0-only

## Author Information

This role was created by the homelab-ops team.
