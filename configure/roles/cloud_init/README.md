homelab_ops.configure.cloud_init
================================

Creates userdata and other cloud-init configuration files within the specified datasource location. The created userdata configuration does the following:

- Creates a user who can SSH in using the specified authorized key
- Sets the hostname and cloud-init instance ID to specified values
- Configures cloud-init to run specified `runcmd` commands during the runcmd stage
  - Any files needed for the `runcmd` commands can be specified under `cloudinit.write_files` to be placed within the datasource

Requirements
------------

- Ansible 2.15 or newer
- This role must be run as root

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `cloudinit.data_source_path` | undefined | The path to the cloud-init datasource directory |
| `cloudinit.local_hostname` | undefined | The hostname to set for the instance |
| `cloudinit.instance_id` | undefined | The cloud-init instance ID to set |
| `cloudinit.users` | `[]` | A list of users to create |
| `cloudinit.runcmd_commands` | `[]` | A list of commands to run during the runcmd stage |
| `cloudinit.write_files` | `[]` | A list of files to write to the datasource |

Each user in the `cloudinit.users` list should be a dictionary with the following keys:

| Key | Required | Description |
| --- | --- | --- |
| `name` | yes | The username |
| `authorized_keys` | yes | A list of SSH public keys to authorize for the user |

Each file in the `cloudinit.write_files` list should be a dictionary with the following keys:

| Key | Required | Description |
| --- | --- | --- |
| `path` | yes | The path where the file should be written |
| `owner` | yes | The owner and group of the file in the format `owner:group` |
| `permissions` | yes | The permissions of the file in octal format (e.g., `'0600'`) |
| `content` | yes | The content of the file |

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: servers
  roles:
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
            - "[ansible-playbook, -c, local, -i, localhost, /opt/playbook.yaml]"
          write_files:
            - path: /opt/playbook.yaml
              owner: 'root:root'
              permissions: '0600'
              content: |
                ---
                - hosts: localhost
                  tasks:
                    - name: Example task
                      ansible.builtin.debug:
                        msg: Hello from cloud-init!
```

See the [Molecule test playbook](../../molecule/cloud_init/converge.yml) for a complete example.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
