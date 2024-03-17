homelab_ops.packages.apt_install
================================

Installs one or more apt packages if not already installed. Additionally, this can configure any required APT repositories that need to be added prior to installation.

This is intended for use in building immutable infrastructure (i.e. building images or installing on newly provisioned infrastructure). Therefore it will not upgrade these packages if they already exist. But in these intended use cases, this will run faster than directly using [ansible.builtin.apt](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html) module. This minimizes image build or first-boot times.

For upgrading, please use [ansible.builtin.apt](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html).

Example Playbook
----------------

See [Molecule test](../../molecule/apt_install/converge.yml)

License
-------

AGPL-3.0-only
