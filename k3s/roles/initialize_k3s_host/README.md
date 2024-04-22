homelab_ops.k3s.initialize_k3s_host
===================================

This role initializes a new host with k3s. It will,
- install k3s as a server/agent node and configure k3s
- install flux on this kubernetes cluster

This is not intended for,
- updating or upgrading a host with an existing k3s installation
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
