homelab_ops.k3s.install_k3s_service
===================================

This installs k3s on a host. It will,
- install k3s as a server or agent node with the requested configuration (node settings, private registry, kubelet, etc)
- if a server url is provided, it will connect this k3s node to the kubernetes cluster at that url.

This is not intended for updating or upgrading k3s version or its configuration.

Requirements
------------

- Must be run as root.

Example Playbook
----------------

See [Molecule test](../../molecule/default/converge.yml).

License
-------

AGPL-3.0-only
