homelab_ops.k3s.bootstrap_flux
==============================

This bootstrap flux on the kubernetes cluster. Bootstrapping steps include:
- prepare and apply the necessary config maps and secrets needed by flux configuration for this cluster.
- create a secret with the ssh key for accessing the git repository with the flux configuration.
- link the kubernetes cluster with the git repository with the flux configuration (so that the cluster will be configured as per that configuration).

Requirements
------------

- Must be run as root.

Example Playbook
----------------

See [Molecule test](../../molecule/default/converge.yml).

License
-------

AGPL-3.0-only
