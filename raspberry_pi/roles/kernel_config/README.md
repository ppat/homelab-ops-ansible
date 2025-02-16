homelab_ops.raspberry_pi.kernel_config
======================================

Creates the kernel `config.txt` file for a Raspberry Pi device.

Requirements
------------

- Ansible 2.15 or newer
- This role must be run as root
- The target device must be a Raspberry Pi running a supported operating system (e.g., Raspberry Pi OS, Ubuntu)

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `kernel.config.disabled_features` | `[]` | A list of features to disable in the kernel configuration (e.g., `bluetooth`, `wifi`, `act_led`) |
| `kernel.config.autodetect` | `[]` | A list of features to autodetect in the kernel configuration (e.g., `display`) |
| `kernel.config.arm_boost_supported` | `false` | Whether the ARM boost feature is supported by the kernel |
| `kernel.filename` | undefined | The filename of the kernel image (e.g., `vmlinux`) |

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: raspberry_pis
  roles:
    - role: homelab_ops.raspberry_pi.kernel_config
      vars:
        kernel:
          config:
            disabled_features:
              - bluetooth
              - wifi
              - act_led
            autodetect:
              - display
            arm_boost_supported: true
          filename: vmlinux
```

See the [Molecule test playbook](../../molecule/kernel_config/converge.yml) for a complete example.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
