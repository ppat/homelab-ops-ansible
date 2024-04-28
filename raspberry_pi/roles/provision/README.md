homelab_ops.raspberry_pi.provision
==================================

Provision a raspberry pi device:
- select a matching block device based on given criteria.
- if and only if that block device has not partitions, then create partitions and filesystems as defined in configuration.
- configure bind mounts, if any.
- unpack an os image on to the root filesystem, if the root filesystem was just created.
- configure cloud-init userdata and ansible-playbook to be invoked by cloud-init on first boot.
- configure device for booting (raspberry pi kernel cmdline, kernel config.txt, and fstab).

Requirements
------------

Must be run as root.

Example Playbook
----------------

See [Molecule test](../../molecule/provision/converge.yml).

License
-------

AGPL-3.0-only
