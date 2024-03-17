homelab_ops.block_device.partition
==================================

Create partitions within an empty block device.

This cannot and is not intended for use in:
- modifying existing partition configuration
- creating new partitions within empty area of block device with pre-existing partitions
It will skip the block device all together, if it has any partitions at all.

Requirements
------------

- Must be run as root.
- `parted` system package is installed.

Example Playbook
----------------

See [Molecule test](../../molecule/partition/converge.yml).

License
-------

AGPL-3.0-only
