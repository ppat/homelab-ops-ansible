homelab_ops.block_device.filesystem
===================================

Create filesystem(s) within an empty (e.g. newly created) partition. This cannot and is not intended for use in modifying existing filesystems. It will skip those.

Requirements
------------

- Must be run as root.
- Partition must exist. You may use [homelab_ops.block_device.partition](../partition/) for creating the partition first.
- System packages corresponding to requested filesystem type(s) must be installed. E.g. `e2fsprogs`, `dosfstools`, `btrfs-progs`, etc.

Example Playbook
----------------

See [Molecule test](../../molecule/filesystem/converge.yml).

License
-------

AGPL-3.0-only
