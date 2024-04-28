homelab_ops.os.ubuntu
=====================

This role configures an Ubuntu OS by ensuring that,
- all necessary packages are installed
- unnecessary packages and services are not present
- all packages are upgraded to latest
- required kernel modules are included in initrd/initramfs
- required kernel parameters (sysctl) are configured

As this role is generally expected to be used to build an OS image, it does not perform the following:
- Boot and/or cloud-init configuration (as that is specific to an installation)
- Applying the kernel parameters (sysctl) in the currently running kernel (as a restart is expected after loading an OS image to a disk)

Requirements
------------

- Must be run as root.

Example Playbook
----------------

See [Molecule test](../../molecule/ubuntu/converge.yml).

License
-------

AGPL-3.0-only
