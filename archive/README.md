# Ansible Collection - homelab_ops.archive

![archive](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-archive.yaml/badge.svg)

A collection for managing OS image deployment through archive operations. This collection handles initial provisioning and updates of filesystem content from archive images.

## Roles

| Role | Description |
| --- | --- |
| [homelab_ops.archive.sync](roles/sync/) | Syncs the content of an archive (such as an OS image) onto a filesystem path. If the filesystem path contains a previous version of that archive, only the changed files are synced. This allows for efficient updates while leveraging filesystem features like copy-on-write. |
| [homelab_ops.archive.unpack](roles/unpack/) | Unpacks an archive (such as an OS image) onto an empty filesystem path. If the filesystem path is not empty, this role will skip unpacking. This is useful for initial provisioning of a filesystem from an archive. |

## Usage

To use the roles in this collection, you can include them in your playbooks:

```yaml
- hosts: all
  roles:
    - role: homelab_ops.archive.sync
      vars:
        archive:
          url: "https://example.com/os-image.tar.gz"
          destination_path: "/mnt/filesystem"
          extracted_size: "5G"
```

See each role's README for more detailed usage instructions and examples.

## Requirements

- Ansible 2.15 or newer
- These roles must be run as root, since archives may contain filesystem paths that should be owned by root.

## License

AGPL-3.0-only

## Author Information

This collection was created by the homelab-ops team.
