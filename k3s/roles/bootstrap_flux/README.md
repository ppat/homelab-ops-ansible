homelab_ops.k3s.bootstrap_flux
==============================

This bootstrap flux on the kubernetes cluster. Bootstrapping steps include:
- prepare and apply any supplied manifests to create any pre-requisite kubernetes resources.
  - For example, setting up any ConfigMaps and/or Secrets needed (such as connecting to secret provider using external-secrets operator, etc).
- prepare and create the flux source that will be used by flux to bootstrap the cluster based on manifests from that source.
  - This includes creating any secrets necessary to connect to that source (e.g. ssh key needed for connecting to a git source)

Requirements
------------

- Must be run as root.

Example Playbook
----------------

See [Molecule test](../../molecule/default/converge.yml).

License
-------

AGPL-3.0-only
