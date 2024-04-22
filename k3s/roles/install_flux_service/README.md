homelab_ops.k3s.install_flux_service
====================================

This installs flux on the given kubernetes cluster. It will,
- install flux CLI on the host
- install the specified flux version on the kubernetes cluster (if the cluster does not already have flux running on it)

This is not intended for updating or upgrading flux. That should be done through changes to the git (or OCI) source that flux is connected to.

Requirements
------------

- Must be run as root.

Example Playbook
----------------

See [Molecule test](../../molecule/default/converge.yml).

License
-------

AGPL-3.0-only
