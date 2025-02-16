homelab_ops.archive.sync
========================

Syncs the content of an archive (such as an OS image) onto a filesystem path. If the filesystem path contains a previous version of that archive, only the changed files from the archive are synced onto the filesystem.

The archive is not directly unpacked to the target filesystem. Instead, it is unpacked to a ramdisk, and then only the differing files (based on checksums) are rsync'd onto the target filesystem. This enables you to release updates from an archive while also making use of the target filesystem's various features (by only writing the changed, relevant content). For example, this can help you avoid unnecessary copy-on-write activity for btrfs filesystems.

Requirements
------------

- Ansible 2.15 or newer
- This role must be run as root
- The following system packages must be installed:
  - rsync
  - wget

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `archive.url` | undefined | URL of the archive to sync |
| `archive.destination_path` | undefined | Filesystem path to sync the archive contents to |
| `archive.extracted_size` | undefined | Estimated size of the extracted archive, used for sizing the ramdisk |

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.archive.sync
      vars:
        archive:
          url: "https://example.com/os-image.tar.gz"
          destination_path: "/mnt/filesystem"
          extracted_size: "5G"
```

See the [Molecule test playbook](../../molecule/sync/converge.yml) and the [GitHub Actions workflow](../../../.github/workflows/test-archive.yaml) for end-to-end examples.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
