homelab_ops.block_device.ramdisk
================================

A role that creates and manages RAM-based filesystems for temporary storage. This role provides high-performance storage for build processes, caching, and testing.

This role enables temporary storage by:

1. Allocating system memory
2. Creating mount points
3. Managing storage state
4. Handling cleanup

Common use cases:

- Package compilation workspace
- Temporary test environments
- High-speed cache storage
- Build process acceleration

Requirements
------------

- Ansible 2.15 or newer
- This role must be run as root

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `ramdisk.mount_location` | undefined | The path where the RAM disk should be mounted |
| `ramdisk.size` | undefined | The size of the RAM disk (e.g., `10M`, `1G`, etc.) |
| `ramdisk.state` | `mounted` | The desired state of the RAM disk (`mounted` or `unmounted`) |

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.block_device.ramdisk
      vars:
        ramdisk:
          mount_location: /mnt/ramdisk
          size: 512M
          state: mounted
```

See the [Molecule test playbook](../../molecule/ramdisk/converge.yml) for a complete example.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
