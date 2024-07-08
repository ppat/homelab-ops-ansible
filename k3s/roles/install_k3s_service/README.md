homelab_ops.k3s.install_k3s_service
===================================

This installs k3s on a host. It will,
- install k3s as a server or agent node with the requested configuration (node settings, private registry, kubelet, etc)
- if a server url is provided, it will connect this k3s node to the kubernetes cluster at that url.

This is not intended for,
- updating or upgrading a host with an existing k3s installation (as that's best done by something like [system-upgrade-controller](https://docs.k3s.io/upgrades/automated)).
- installing and/or configuring system software (especially configurations that require a restart) as those are best installed in the image that is used to build the host.

Requirements
------------

- Must be run as root.

Example Playbook
----------------

See [Molecule test](../../molecule/default/converge.yml).

License
-------

AGPL-3.0-only
