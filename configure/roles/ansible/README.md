homelab_ops.configure.ansible [DEPRECATED]
=====================================

**DEPRECATION NOTICE:** This role is deprecated and will be removed in version 2.0.0.
Please use homelab_ops.configure.cloud_init's runcmd commands to set up ansible as needed. For most use cases, it's recommended to run ansible from a controller node targeting inventory hosts, eliminating the need to install ansible on remote hosts. This simplifies inventory host setup and reduces attack surface.

Installs a specified version of ansible-core and a list of Python package dependencies within the same virtual environment using pipx. Also installs a given set of Ansible collections.

Requirements
------------

- Ansible 2.15 or newer
- This role must be run as root
- `pipx` must be installed on the target system

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `ansible_config.ansible_core_version` | undefined | The version of ansible-core to install |
| `ansible_config.dependencies` | `[]` | A list of Python packages to install alongside ansible-core |
| `ansible_config.collections_requirements_file` | undefined | Path to a requirements file listing Ansible collections to install |

The `ansible_config.dependencies` variable is a list of dictionaries, where each dictionary represents a Python package to install and has the following keys:

| Key | Required | Description |
| --- | --- | --- |
| `name` | yes | The name of the Python package |
| `version` | yes | The version of the Python package to install |
| `params` | no | A list of additional parameters to pass to `pipx install` |

Dependencies
------------

None

Example Playbook
----------------

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
```

The `requirements.yaml` file should follow this format:

```yaml
collections:
  - name: community.general
    version: 6.5.0
  - name: ansible.posix
    version: 1.5.1
```

See the [Molecule test playbook](../../molecule/ansible/converge.yml) for a complete example.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
