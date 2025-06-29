# homelab_ops.archive.sync

A role that updates filesystem content from archives using efficient change detection. This role enables incremental OS image updates while preserving filesystem features.

This role updates OS images by:

1. Staging content in ramdisk during unpacking
2. Detecting changed files compared to target filesystem path
3. Syncing only the changed or newer files to the target

## Requirements

- Ansible 2.15 or newer
- This role must be run as root
- The following system packages must be installed:
  - rsync
  - wget

## Role Variables

| Variable | Default | Description |
| --- | --- | --- |
| `archive.url` | undefined | URL of the archive to sync |
| `archive.destination_path` | undefined | Filesystem path to sync the archive contents to |
| `archive.extracted_size` | undefined | Estimated size of the extracted archive, used for sizing the ramdisk |

## Dependencies

None

## Example Playbook

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

## License

AGPL-3.0-only

## Author Information

This role was created by the homelab-ops team.
