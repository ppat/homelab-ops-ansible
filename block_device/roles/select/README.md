homelab_ops.block_device.select
===============================

A role that identifies and selects block devices based on specified criteria. This role starts the storage provisioning workflow by finding appropriate devices for partitioning and filesystem creation.

This role can be used independently but its more commonly used as part of `block_device.provision` workflow. This starts that workflow by:

1. Scanning available devices
2. Filtering based on criteria
3. Validating that there was at least 1 matching block device

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
