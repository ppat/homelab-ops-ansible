homelab_ops.archive.sync
========================

Syncs the content of an archive (such as an OS image) on to a filesystem path. If the filesystem path contains a previous version of that archive, then only the changed files from an archive are unpacked onto the filesystem.

The archive is not directly unpacked to the target filesystem, but unpacked to ramdisk and then only the different files (based on checksums) are rsync'd on to the target filesystem. This will enables you to release updates from archive while also making using target filesystem's various features (by only writing the changed, relevant content). For example, this can help you avoid unnecessary copy-on-write activity for btrfs filesystems.

Requirements
------------

Since archives may contain filesystem paths that should be owned by root, this must be run as root.

Example Playbook
----------------

See [Molecule test](../../molecule/sync/).

License
-------

AGPL-3.0-only
