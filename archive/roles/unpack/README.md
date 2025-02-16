homelab_ops.archive.unpack
==========================

A role that deploys initial filesystem content from archives. This role handles first-time OS image provisioning with data protection measures.

This role deploys OS image archive on to a filesystem by:

1. First verifying that target filesystem is empty
2. Extracting archive content directly on to the target filesystem

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
