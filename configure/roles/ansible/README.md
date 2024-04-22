homelab_ops.configure.ansible
=============================

Installs a given version of ansible-core and a list of python package dependencies within the same virtual environment using pipx. Also installs a given set of ansible collections.

Requirements
------------

- Must be run as root.
- `pipx` must be installed already.

Example Playbook
----------------

See [Molecule test](../../molecule/ansible/converge.yml).

License
-------

AGPL-3.0-only
