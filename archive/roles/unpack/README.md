homelab_ops.archive.unpack
==========================

Unpacks an archive (such as an OS image) onto an empty filesystem path. If the filesystem path is not empty, this role will skip unpacking.

This role is useful for initial provisioning of a filesystem from an archive. It ensures that the archive is only unpacked onto an empty filesystem, preventing accidental overwriting of existing data.

Requirements
------------

- Ansible 2.15 or newer
- This role must be run as root
- The following system packages must be installed:
  - wget

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `archive.url` | undefined | URL of the archive to unpack |
| `archive.destination_path` | undefined | Filesystem path to unpack the archive contents to |

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.archive.unpack
      vars:
        archive:
          url: "https://example.com/os-image.tar.gz"
          destination_path: "/mnt/filesystem"
```

See the [Molecule test playbook](../../molecule/unpack/converge.yml) and the [GitHub Actions workflow](../../../.github/workflows/test-archive.yaml) for end-to-end examples.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
