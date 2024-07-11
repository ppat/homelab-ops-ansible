homelab_ops.configure.cloud_init
================================

Create userdata and other cloud-init configuration files within the specified datasource location. Created userdata configuration does the following:
- creates a user who can ssh in using the specified authorized key
- sets hostname and cloud-init instance-id to specified values
- configures cloud-init to run the specified `cloudinit.runcmd_commands` during the runcmd stage
  - any files needed for this can be specified under `cloudinit.runcmd_files` to be placed within the datasource.

Requirements
------------

Must be run as root.

Example Playbook
----------------

See [Molecule test](../../molecule/cloud-init/converge.yml).

License
-------

AGPL-3.0-only
