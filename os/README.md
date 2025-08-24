# Ansible Collection - homelab_ops.os

![os](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-os.yaml/badge.svg)

A collection for building and configuring operating system images. This collection prepares base images for immutable infrastructure deployments.

## Roles

| Role | Description |
| --- | --- |
| [homelab_ops.os.ubuntu](roles/ubuntu/) | Configures an Ubuntu Linux OS by installing necessary software packages, configuring kernel modules and sysctl parameters, building a new initramfs, and performing other OS-level setup tasks. |

## Usage

To use the roles in this collection, include them in your playbooks:

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.os.ubuntu
      vars:
        os_packages:
          install:
            - htop
            - tmux
            - vim
          uninstall:
            - nano
        sysctl:
          vm.swappiness: 10
          net.ipv4.ip_forward: 1
        modules:
          - br_netfilter
          - overlay
        initramfs_rebuild: true
```

See the role's README for more detailed usage instructions and examples.

## Requirements

- Ansible 2.18 or newer
- The roles in this collection must be run as root
- The target system must be running a supported version of Ubuntu Linux

## License

AGPL-3.0-only

## Author Information

This collection was created by the homelab-ops team.
