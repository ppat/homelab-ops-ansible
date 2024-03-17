# Ansible Collection - homelab_ops.archive

![archive](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-archive.yaml/badge.svg)

This collection supplies roles that aid in archive management as part of homelab operations.

## Roles

| role | description |
| --- | --- |
| [homelab_ops.archive.sync](roles/sync/) | Syncs the content of an archive on to a filesystem path. Overwrites any existing content. |
| [homelab_ops.archive.unpack](roles/unpack/) | Unpack an archive on to an empty filesystem path. No-op if filesystem path is not empty. |
