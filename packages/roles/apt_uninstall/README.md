homelab_ops.packages.apt_uninstall
==================================

Provides the capability to uninstall apt packages. Unlike [ansible.builtin.apt](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html) module which simply removes apt packages, this provides the capability to:
  - Stop any running systemd services (or timers) before removal of packages
  - Clean up any directories that are no longer required
  - Prevent re-installation, if necessary.

Example Playbook
----------------

See [Molecule test](../../molecule/apt_uninstall/converge.yml)

License
-------

AGPL-3.0-only
