homelab_ops.configure.fstab
===========================

Generates an `/etc/fstab` file from the filesystems currently mounted under the specified root directory.

Requirements
------------

- Ansible 2.15 or newer
- This role must be run as root
- The target filesystems must be mounted under the specified root directory

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `system_root_mount_path` | undefined | The path to the root directory containing the mounted filesystems |

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.configure.fstab
      vars:
        system_root_mount_path: /mnt/root
```

In this example, the role will generate an `/etc/fstab` file based on the filesystems mounted under `/mnt/root`.

See the [Molecule test playbook](../../molecule/fstab/converge.yml) and the [GitHub Actions workflow](../../../.github/workflows/test-configure.yaml) for end-to-end examples.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
