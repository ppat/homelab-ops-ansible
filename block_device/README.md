# Ansible Collection - homelab_ops.block_device

![block_device](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-block_device.yaml/badge.svg)

A collection for managing block devices, partitions, and filesystems. This collection provides the storage layer for OS image deployment and system provisioning.

This collection enables the storage provisioning workflow by:

1. Selecting target block device by its characteristics
2. Creating partitions and filesystems on that selected block device
3. Managing mount points

## Roles

| Role | Description |
| --- | --- |
| [homelab_ops.block_device.filesystem](roles/filesystem/) | Creates filesystem(s) within an empty partition. This role is intended for use on newly created partitions and will skip existing filesystems. |
| [homelab_ops.block_device.partition](roles/partition/) | Creates partitions within an empty block device. This role is intended for use on empty block devices and will skip devices with existing partitions. |
| [homelab_ops.block_device.ramdisk](roles/ramdisk/) | Creates a RAM disk. |
| [homelab_ops.block_device.select](roles/select/) | Selects a block device by filtering on matching fields. You can specify required matches under `include` and required non-matches under `exclude`. |

## Usage

To use the roles in this collection, include them in your playbooks:

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.block_device.partition
      vars:
        disk: "/dev/sdb"
        size_unit: MiB
        partition_table_type: gpt
        partitions:
          - name: boot
            number: 1
            size: 512
            flags: ['boot', 'esp']
          - name: root
            number: 2
            size: ~

    - role: homelab_ops.block_device.filesystem
      vars:
        disk: "/dev/sdb"
        partitions:
          - name: boot
            number: 1
            filesystem_type: vfat
            mount_path: /boot/efi
          - name: root
            number: 2
            filesystem_type: ext4
            mount_path: /
```

See each role's README and the [Molecule test playbooks](molecule/) for more detailed usage examples.

## Requirements

- Ansible 2.15 or newer
- These roles must be run as root
- Required system packages for each filesystem type (e.g., `e2fsprogs` for ext4, `btrfs-progs` for btrfs, etc.)
- `parted` for the partition role

## License

AGPL-3.0-only

## Author Information

This collection was created by the homelab-ops team.
