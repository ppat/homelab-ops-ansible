# homelab_ops.configure.fstab

A role that manages filesystem mount configuration through fstab generation. This role enables system boot by configuring persistent mount points.

This role manages filesystem mounting by:

1. Identifying mounted filesystems
2. Generating fstab and writing it to `etc/fstab` under requested location

## Requirements

- Ansible 2.15 or newer
- This role must be run as root
- The target filesystems must be mounted under the specified root directory

## Role Variables

| Variable | Default | Description |
| --- | --- | --- |
| `system_root_mount_path` | undefined | The path to the root directory containing the mounted filesystems |

## Dependencies

None

## Example Playbook

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.configure.fstab
      vars:
        system_root_mount_path: /mnt/root
```

In this example, the role will generate an `/etc/fstab` file based on the filesystems mounted under `/mnt/root`.

See the [Molecule test playbook](../../molecule/fstab/converge.yml) and the [GitHub Actions workflow](../../../.github/workflows/test-configure.yaml) for end-to-end examples.

## License

AGPL-3.0-only

## Author Information

This role was created by the homelab-ops team.
