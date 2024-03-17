homelab_ops.packages.install_from_url
=====================================

Install a package from a URL. The package maybe in an archive or binary format.

This is intended for use in building immutable infrastructure (mostly images or recently provisioned infrastructure), so it will not upgrade the given package if they already exist.

Example Playbook
----------------

See these Molecule tests:
- [Install package from archive at URL](../../molecule/install_from_url.package_as_archive/converge.yml)
- [Install package from binary at URL](../../molecule/install_from_url.package_as_binary/converge.yml)

License
-------

AGPL-3.0-only
