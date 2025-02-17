homelab_ops.raspberry_pi.provision [DEPRECATED]
==================================

**DEPRECATION NOTICE:** This role is deprecated and will be removed in version 2.0.0.
This wrapper role is being replaced by direct usage of its underlying collections and roles, which provides better granular control. The collections this role depends on will remain available. A playbook that provides similar functionality to this role is under consideration.

A role that orchestrates complete Raspberry Pi device setup. This role coordinates multiple collections to handle storage, boot configuration, and system initialization.

This role orchestrates device setup by:

- Selecting a block device based on given criteria
- Creating partitions and filesystems if the block device is empty
- Configuring bind mounts
- Unpacking an OS image onto the root filesystem
- Configuring cloud-init userdata and Ansible playbooks to be invoked by cloud-init on first boot
- Configuring the device for booting (`cmdline.txt`, `config.txt`, and `fstab`)

Requirements
------------

- Ansible 2.15 or newer
- This role must be run as root
- The target device must be a Raspberry Pi running a supported operating system (e.g., Raspberry Pi OS, Ubuntu)

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `provision.block_device.additional_bind_mounts` | `[]` | A list of additional bind mounts to configure |
| `provision.block_device.partitions` | `{}` | A dictionary of partitions to create |
| `provision.block_device.root_mount_point` | undefined | The path where the root filesystem will be mounted |
| `provision.block_device.selector` | `{}` | Criteria for selecting the block device to provision |
| `provision.block_device.size_unit` | undefined | The unit to use for partition sizes (e.g., `MiB`, `GiB`) |
| `provision.os_image.url` | undefined | The URL of the OS image to unpack onto the root filesystem |
| `provision.os_image.distribution_release` | undefined | The distribution release of the OS image (e.g., `jammy`, `noble`) |
| `provision.raspberry_pi.serial` | undefined | The serial number of the Raspberry Pi device |
| `provision.raspberry_pi.kernel` | `{}` | Kernel configuration options |
| `provision.cloudinit` | `{}` | cloud-init configuration options |

Dependencies
------------

This role depends on the following roles:

- `homelab_ops.block_device.select`
- `homelab_ops.block_device.partition`
- `homelab_ops.block_device.filesystem`
- `homelab_ops.archive.unpack`
- `homelab_ops.configure.cloud_init`
- `homelab_ops.configure.fstab`
- `homelab_ops.raspberry_pi.kernel_cmdline`
- `homelab_ops.raspberry_pi.kernel_config`

Example Playbook
----------------

```yaml
- hosts: raspberry_pis
  roles:
    - role: homelab_ops.raspberry_pi.provision
      vars:
        provision:
          block_device:
            additional_bind_mounts:
              - src: /srv/longhorn
                target: /var/lib/longhorn
            partitions:
              boot:
                size: 256
              root:
                size: 4096
                filesystem_type: ext4
            root_mount_point: /mnt/root
            selector:
              include:
                type: mmc
                path: /dev/mmcblk0
            size_unit: MiB
          os_image:
            url: "https://cdimage.ubuntu.com/releases/22.04/release/ubuntu-22.04-preinstalled-server-arm64+raspi.img.xz"
            distribution_release: jammy
          raspberry_pi:
            serial: '10000000abcdef'
            kernel:
              config:
                arm_boost_supported: true
                disabled_features:
                  - bluetooth
                  - wifi
          cloudinit:
            ssh_users:
              - name: myuser
                authorized_keys:
                  - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKg+VLNODvNasN+qJYnSdRdw4X/rhZ9Wfn3BzSRVTn2W myuser@example.com
            runcmd_commands:
              - "[timedatectl, set-ntp, 'true']"
```

See the [Molecule test playbook](../../molecule/provision/converge.yml) for a complete example.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
