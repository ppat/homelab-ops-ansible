# Ansible Collection - homelab_ops.configure

![configure](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-configure.yaml/badge.svg)

A collection for managing system configuration and boot processes. This collection handles initial system setup, service management, and state persistence.

## Roles

| Role | Description |
| --- | --- |
| [homelab_ops.configure.cloud_init](roles/cloud_init/) | Creates userdata and other cloud-init configuration files within the specified datasource location. The created userdata configuration creates a user who can SSH in using the specified authorized key, sets the hostname and cloud-init instance ID to specified values, and configures cloud-init to run specified `runcmd` commands during the runcmd stage. Any files needed for the `runcmd` commands can be specified under `cloudinit.write_files` to be placed within the datasource. |
| [homelab_ops.configure.fstab](roles/fstab/) | Generates an `/etc/fstab` file from the filesystems currently mounted under the specified root directory. |
| [homelab_ops.configure.ansible](roles/ansible/) [DEPRECATED] | [DEPRECATED] Installs a specified version of ansible-core and a list of Python package dependencies within the same virtual environment using pipx. Also installs a given set of Ansible collections. This role is deprecated and will be removed in version 2.0.0. Use homelab_ops.configure.cloud_init's runcmd commands to set up ansible as needed. |

## Usage

To use the roles in this collection, include them in your playbooks:

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.configure.ansible
      vars:
        ansible_config:
          ansible_core_version: "2.18.2"
          dependencies:
            - name: jmespath
              version: "1.0.1"
              params:
                - include-apps
          collections_requirements_file: "requirements.yaml"

    - role: homelab_ops.configure.cloud_init
      vars:
        cloudinit:
          data_source_path: "/var/lib/cloud/seed/nocloud-net"
          local_hostname: myserver
          instance_id: myserver-01
          users:
            - name: myuser
              authorized_keys:
                - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKg+VLNODvNasN+qJYnSdRdw4X/rhZ9Wfn3BzSRVTn2W myuser@example.com
          runcmd_commands:
            - "[timedatectl, set-ntp, 'true']"
          write_files:
            - path: /etc/myapp/config.yaml
              owner: 'root:root'
              permissions: '0600'
              content: |
                key: value

    - role: homelab_ops.configure.fstab
      vars:
        system_root_mount_path: /mnt/root
```

See each role's README and the [Molecule test playbooks](molecule/) for more detailed usage examples.

## Requirements

- Ansible 2.15 or newer
- These roles must be run as root
- `pipx` must be installed for the ansible role
- The target filesystems must be mounted for the fstab role

## License

AGPL-3.0-only

## Author Information

This collection was created by the homelab-ops team.
