homelab_ops.block_device.provision
==================================

Provision a block device's partitions and filesystems:
- select a matching block device based on given criteria using [homelab_ops.block_device.select](https://github.com/ppat/homelab-ops-ansible/tree/main/block_device/roles/select).
- if and only if that block device has not partitions, then
  - create partitions using [homelab_ops.block_device.partition](https://github.com/ppat/homelab-ops-ansible/tree/main/block_device/roles/partition)
  - create filesystems using [homelab_ops.block_device.filesystem](https://github.com/ppat/homelab-ops-ansible/tree/main/block_device/roles/filesystem)
  - configure any requested bind mounts, if any.

Requirements
------------

Must be run as root.

Example Playbook
----------------

See [Molecule test](../../molecule/provision/converge.yml).

License
-------

AGPL-3.0-only
