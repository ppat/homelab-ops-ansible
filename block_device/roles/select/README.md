homelab_ops.block_device.select
===============================

Select a block device by filtering on matching fields.
- You may look specify required matches under `include` and required non-matches under `exclude` dictionary fields.
- If multiple fields are specified, they are `AND`'d together.
- You can specify any fields listed under most fields specified under `Available output columns` in `lsblk --help`.
  - All device fields are supported.
  - A subset of [these specific partition/filesystem fields](defaults/main.yaml) are also supported.

Example Playbook
----------------

See [Molecule test](../../molecule/select/converge.yml).

License
-------

AGPL-3.0-only
