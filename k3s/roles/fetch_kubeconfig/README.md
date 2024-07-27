homelab_ops.k3s.fetch_kubeconfig
====================================

Fetches a kubeconfig file from a remote node's location to a local location
- Only fetched if it does not already exist on local location
- Updates the references to the apiserver URL in fetched file to refer to the remote node's hostname

Requirements
------------

- Must be run as root.

Example Playbook
----------------

Indirectly invoked via [Molecule test](../../molecule/default/converge.yml).

License
-------

AGPL-3.0-only
