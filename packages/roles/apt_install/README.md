# homelab_ops.packages.apt_install

A role that installs APT packages and configures repositories for immutable infrastructure. This role optimizes package installation for image building or first-boot scenarios.

This role manages APT packages by:

1. Configuring required apt repositories, if required
2. Installing specified packages

Not intended for upgrading existing packages. For upgrades, use the [ansible.builtin.apt](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html) module directly. It will not upgrade packages if they already exist. In these intended use cases, this role will run faster than directly using the [ansible.builtin.apt](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html) module, minimizing image build or first-boot times.

## Requirements

- Ansible 2.10 or newer
- This role must be run as root
- The target system must be running a Debian-based Linux distribution (e.g., Debian, Ubuntu)

## Role Variables

| Variable | Default | Description |
| --- | --- | --- |
| `packages` | `[]` | A list of APT packages to install |
| `repositories` | `[]` | A list of APT repositories to configure before installing packages |

Each repository in the `repositories` list should be a dictionary with the following keys:

| Key | Required | Description |
| --- | --- | --- |
| `name` | yes | A unique name for the repository |
| `key_url` | yes | The URL of the repository's GPG key |
| `url` | yes | The URL of the APT repository |

## Dependencies

None

## Example Playbook

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.packages.apt_install
      vars:
        packages:
          - docker-ce
          - docker-ce-cli
          - docker-compose-plugin
        repositories:
          - name: docker
            key_url: https://download.docker.com/linux/ubuntu/gpg
            url: https://download.docker.com/linux/ubuntu
```

See the [Molecule test playbook](../../molecule/apt_install/converge.yml) and the [GitHub Actions workflow](../../../.github/workflows/test-packages.yaml) for end-to-end examples.

## License

AGPL-3.0-only

## Author Information

This role was created by the homelab-ops team.
