homelab_ops.configure.cloud_init
================================

Create userdata and other cloud-init configuration files within the specified location. Created userdata configuration does the following:
- creates a user who can ssh in using the specified authorized key
- sets hostname and cloud-init instance-id to specified values
- configures cloud-init to update time using ntp on first boot
- configures cloud-init to run given ansible playbook on first boot with given ansible vars file (playbook and vars file must be added separately).

Requirements
------------

Must be run as root.

Example Playbook
----------------

See [Molecule test](../../molecule/cloud-init/converge.yml).

License
-------

AGPL-3.0-only
