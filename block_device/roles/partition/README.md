# homelab_ops.block_device.partition

A role that creates and configures partitions on empty block devices. This role continues the storage provisioning workflow by preparing devices for filesystem creation.

This role can be used independently but its more commonly used as part of `block_device.provision` workflow. This role continues that workflow by:

1. Creating partition tables
2. Configuring partitions
3. Setting partition flags
4. Preparing for filesystem creation

Not intended for modifying existing partition configurations or creating new partitions within partially used block devices.

## Requirements

- Ansible 2.15 or newer
- This role must be run as root
- The `parted` system package must be installed
- The target block device must be empty (i.e., contain no partitions)

## Role Variables

| Variable | Default | Description |
| --- | --- | --- |
| `disk` | undefined | The path to the block device to partition |
| `size_unit` | undefined | The unit to use for partition sizes (e.g., `MiB`, `GiB`, `TiB`, etc.) |
| `partition_table_type` | undefined | The partition table type to create (e.g., `msdos`, `gpt`, etc.) |
| `partitions` | `[]` | A list of partitions to create |

Each partition in the `partitions` list should be a dictionary with the following keys:

| Key | Required | Description |
| --- | --- | --- |
| `name` | yes | A descriptive name for the partition |
| `number` | yes | The partition number |
| `size` | yes | The size of the partition in the specified `size_unit`. Use `~` for remaining space. |
| `flags` | no | A list of flags to set on the partition (e.g., `['boot', 'esp']`) |

## Dependencies

None

## Example Playbook

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
            size: 20480
          - name: data
            number: 3
            size: ~
```

See the [Molecule test playbook](../../molecule/partition/converge.yml) for a complete example.

## License

AGPL-3.0-only

## Author Information

This role was created by the homelab-ops team.
