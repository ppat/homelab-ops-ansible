homelab_ops.block_device.filesystem
===================================

Creates filesystem(s) within an empty (e.g., newly created) partition. This role is intended for use on newly created partitions and will skip existing filesystems. It cannot and should not be used to modify existing filesystems.

Requirements
------------

- Ansible 2.15 or newer
- This role must be run as root
- System packages corresponding to the requested filesystem type(s) must be installed (e.g., `e2fsprogs` for ext4, `btrfs-progs` for btrfs, `dosfstools` for vfat, etc.)
- The target partition(s) must exist, which can be achieved using the [homelab_ops.block_device.partition](../partition/) role

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `disk` | undefined | The path to the block device containing the partition(s) |
| `partitions` | `[]` | A list of partitions to create filesystems on |

Each partition in the `partitions` list should be a dictionary with the following keys:

| Key | Required | Description |
| --- | --- | --- |
| `name` | yes | A descriptive name for the partition |
| `number` | yes | The partition number |
| `filesystem_type` | yes | The filesystem type to create (e.g., `ext4`, `btrfs`, `vfat`, etc.) |
| `mount_path` | yes | The path where the filesystem should be mounted |
| `filesystem_options` | no | Additional filesystem-specific options |

For btrfs filesystems, the `filesystem_options` dictionary can contain a `subvolumes` key, which is a list of subvolumes to create. Each subvolume should be a dictionary with the following keys:

| Key | Required | Description |
| --- | --- | --- |
| `name` | yes | A descriptive name for the subvolume |
| `path` | yes | The relative path of the subvolume within the filesystem |
| `copy_on_write` | no | Whether copy-on-write should be enabled for the subvolume (default: `true`) |

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
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
            filesystem_type: btrfs
            mount_path: /
            filesystem_options:
              subvolumes:
                - name: root
                  path: /
                - name: home
                  path: /home
                - name: snapshots
                  path: /.snapshots
          - name: data
            number: 3
            filesystem_type: ext4
            mount_path: /data
```

See the [Molecule test playbook](../../molecule/filesystem/converge.yml) for a complete example.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
