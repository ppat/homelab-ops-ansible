# Ansible Collection - homelab_ops.block_device

![block_device](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-block_device.yaml/badge.svg)

This collection supplies roles that aid in block-device management as part of homelab operations.

## Roles

| role | description |
| --- | --- |
| [homelab_ops.block_device.filesystem](roles/filesystem/) | Create filesystem(s) within an empty partition. |
| [homelab_ops.block_device.partition](roles/partition/) | Create partitions within an empty block device. |
| [homelab_ops.block_device.ramdisk](roles/ramdisk/) | Create a RAM disk. |
| [homelab_ops.block_device.select](roles/select/) | Select a block device by filtering on matching fields. |
