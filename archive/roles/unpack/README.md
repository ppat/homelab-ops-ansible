homelab_ops.archive.unpack
==========================

Unpack an archive (such as an OS image) on to an empty filesystem path. If the filesystem path is not empty, this role will skip unpacking.

Requirements
------------

Since archives may contain filesystem paths that should be owned by root, this must be run as root.

Example Playbook
----------------

See [Molecule test](../../molecule/unpack/).

License
-------

AGPL-3.0-only
