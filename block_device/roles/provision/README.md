homelab_ops.block_device.provision
==================================

Provisions a block device's partitions and filesystems:
- Selects a matching block device based on given criteria using [homelab_ops.block_device.select](https://github.com/ppat/homelab-ops-ansible/tree/main/block_device/roles/select)
- If and only if that block device has no partitions, then:
  - Creates partitions using [homelab_ops.block_device.partition](https://github.com/ppat/homelab-ops-ansible/tree/main/block_device/roles/partition)
  - Creates filesystems using [homelab_ops.block_device.filesystem](https://github.com/ppat/homelab-ops-ansible/tree/main/block_device/roles/filesystem)
  - Configures any requested bind mounts

Requirements
------------

- Ansible 2.15 or newer
- This role must be run as root
- The following system packages must be installed:
  - dosfstools (if created vfat filesystems)
  - btrfs-progs (if created btrfs filesystems)
  - e2fsprogs (if created ext4 filesystems)
  - parted

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `block_device.additional_bind_mounts` | `[]` | List of additional bind mounts to configure |
| `block_device.partitions` | `{}` | Dictionary of partitions to create |
| `block_device.root_mount_point` | undefined | Path where the root filesystem will be mounted |
| `block_device.selector` | `{}` | Criteria for selecting the block device |
| `block_device.size_unit` | undefined | Unit to use for partition sizes (e.g., `MiB`, `GiB`) |

Each bind mount in `block_device.additional_bind_mounts` should be a dictionary with:

| Key | Required | Description |
| --- | --- | --- |
| `src` | yes | Source path to bind mount from |
| `target` | yes | Target path to bind mount to |

The `block_device.partitions` dictionary should have partition names as keys, with each value being a dictionary containing:

| Key | Required | Description |
| --- | --- | --- |
| `size` | yes | Size of the partition (use `~` for remaining space) |
| `filesystem_type` | no | Type of filesystem to create (e.g., `ext4`, `btrfs`, `vfat`) |
| `filesystem_options` | no | Additional filesystem-specific options |

For btrfs filesystems, the `filesystem_options` dictionary can contain a `subvolumes` key with a list of subvolumes to create. Each subvolume should be a dictionary with:

| Key | Required | Description |
| --- | --- | --- |
| `name` | yes | Name of the subvolume |
| `path` | yes | Path of the subvolume within the filesystem |
| `copy_on_write` | no | Whether copy-on-write should be enabled (default: `true`) |

Dependencies
------------

This role depends on the following roles:
- homelab_ops.block_device.select
- homelab_ops.block_device.partition
- homelab_ops.block_device.filesystem

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.block_device.provision
      vars:
        block_device:
          additional_bind_mounts:
            - src: /srv/longhorn
              target: /var/lib/longhorn
            - src: /tmp
              target: /var/tmp
          partitions:
            boot:
              size: 256
              filesystem_type: vfat
            root:
              size: 4096
              filesystem_type: btrfs
              filesystem_options:
                subvolumes:
                  - name: root
                    path: /
                  - name: home
                    path: /home
                  - name: snapshots
                    path: /.snapshots
                    copy_on_write: true
                  - name: var
                    path: /var
                    copy_on_write: false
            data:
              size: ~
              filesystem_type: ext4
          root_mount_point: /mnt/root
          selector:
            include:
              type: disk
              path: /dev/sda
          size_unit: MiB
```

See the [Molecule test playbook](../../molecule/provision/converge.yml) and the [GitHub Actions workflow](../../../.github/workflows/test-block_device.yaml) for end-to-end examples.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
