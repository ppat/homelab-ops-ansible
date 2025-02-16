# Ansible Collection - homelab_ops.packages

![packages](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-packages.yaml/badge.svg)

This collection provides roles for managing packages as part of homelab operations. It includes roles for installing and uninstalling APT packages, as well as installing packages from a URL.

## Roles

| Role | Description |
| --- | --- |
| [homelab_ops.packages.apt_install](roles/apt_install/) | Installs one or more APT packages if not already installed. Can also configure any required APT repositories that need to be added prior to installation. This role is intended for use in building immutable infrastructure, so it will not upgrade packages if they already exist. |
| [homelab_ops.packages.apt_uninstall](roles/apt_uninstall/) | Uninstalls APT packages, with the ability to stop any running systemd services (or timers) before removal, clean up any directories that are no longer required, and prevent re-installation if necessary. |
| [homelab_ops.packages.install_from_url](roles/install_from_url/) | Installs a package from a URL. The package may be in an archive or binary format. This role is intended for use in building immutable infrastructure, so it will not upgrade the package if it already exists. |

## Usage

To use the roles in this collection, include them in your playbooks:

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.packages.apt_install
      vars:
        packages:
          - htop
          - tmux
        repositories:
          - name: example
            key_url: https://example.com/gpg
            url: https://example.com/apt

    - role: homelab_ops.packages.apt_uninstall
      vars:
        packages:
          - name: nano
          - name: apache2
            systemd_services: [apache2]

    - role: homelab_ops.packages.install_from_url
      vars:
        package:
          name: terraform
          version: 1.4.6
          url: "https://releases.hashicorp.com/terraform/{{ version }}/terraform_{{ version }}_linux_amd64.zip"
          path: /usr/local/bin
          mode: '0755'
```

See each role's README for more detailed usage instructions and examples.

## Requirements

- Ansible 2.15 or newer
- The roles in this collection must be run as root
- The target system must be running a Debian-based Linux distribution (e.g., Debian, Ubuntu)

## License

AGPL-3.0-only

## Author Information

This collection was created by the homelab-ops team.
