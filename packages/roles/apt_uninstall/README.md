homelab_ops.packages.apt_uninstall
==================================

Provides the capability to uninstall APT packages. Unlike the [ansible.builtin.apt](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html) module, which simply removes APT packages, this role provides the ability to:

- Stop any running systemd services (or timers) before removing packages
- Clean up any directories that are no longer required
- Prevent re-installation, if necessary

Requirements
------------

- Ansible 2.10 or newer
- This role must be run as root
- The target system must be running a Debian-based Linux distribution (e.g., Debian, Ubuntu)

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `packages` | `[]` | A list of APT packages to uninstall |

Each package in the `packages` list should be a dictionary with the following keys:

| Key | Required | Description |
| --- | --- | --- |
| `name` | yes | The name of the APT package to uninstall |
| `systemd_services` | no | A list of systemd services to stop before uninstalling the package |
| `reinstall` | no | Set to `prevent` to prevent the package from being reinstalled (default: `allow`) |

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.packages.apt_uninstall
      vars:
        packages:
          - name: curl
          - name: postgresql
            systemd_services: [postgresql]
          - name: ripgrep
            reinstall: prevent
```

See the [Molecule test playbook](../../molecule/apt_uninstall/converge.yml) and the [GitHub Actions workflow](../../../.github/workflows/test-packages.yaml) for end-to-end examples.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
