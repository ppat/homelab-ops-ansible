homelab_ops.block_device.select
===============================

Selects a block device by filtering on matching fields. You can specify required matches under `include` and required non-matches under `exclude`. If multiple fields are specified, they are logically AND'd together.

You can filter on any fields listed under the "Available output columns" section in `lsblk --help`, with a few exceptions:

- All device fields are supported
- Only a subset of partition/filesystem fields are supported (see [defaults/main.yaml](defaults/main.yaml) for the list of supported fields)

Requirements
------------

- Ansible 2.15 or newer
- This role must be run as root

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `device.include` | `{}` | A dictionary of fields and values that the selected device must match |
| `device.exclude` | `{}` | A dictionary of fields and values that the selected device must not match |
| `device.no_partitions` | `false` | If `true`, only devices with no partitions will be selected |

The `device` variable is a dictionary that can contain the following keys:

| Key | Required | Description |
| --- | --- | --- |
| `include` | no | A dictionary of fields and values that the selected device must match |
| `exclude` | no | A dictionary of fields and values that the selected device must not match |
| `no_partitions` | no | If `true`, only devices with no partitions will be selected (default: `false`) |

The `include` and `exclude` dictionaries can contain any of the fields listed under the "Available output columns" section in `lsblk --help`, with the exceptions noted above.

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.block_device.select
      vars:
        device:
          include:
            type: disk
            size: '931.5G'
          exclude:
            mountpoint: "/"
          no_partitions: true
```

See the [Molecule test playbook](../../molecule/select/converge.yml) for more examples.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
