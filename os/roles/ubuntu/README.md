# homelab_ops.os.ubuntu

A role that configures Ubuntu systems for image-based deployments. This role prepares Ubuntu installations with package management, kernel configuration, and system optimization.

This role prepares Ubuntu systems by:

- All necessary packages are installed
- Unnecessary packages and services are not present
- All packages are upgraded to the latest version
- Required kernel modules are included in initrd/initramfs
- Required kernel parameters (sysctl) are configured

Not intended for:

- Boot and/or cloud-init configuration (as that is specific to an installation)
- Applying kernel parameters (sysctl) in the currently running kernel (as a restart is expected after loading an OS image to a disk)

## Requirements

- Ansible 2.15 or newer
- This role must be run as root
- The following system packages must be installed:
  - binfmt-support
  - qemu-user-static
  - parted

## Role Variables

| Variable | Default | Description |
| --- | --- | --- |
| `packages.install` | `[]` | List of packages to install |
| `packages.uninstall` | `[]` | List of packages to uninstall |
| `kernel.modules` | `[]` | List of kernel modules to include in initramfs |
| `kernel.sysctl` | `{}` | Dictionary of sysctl parameters to configure |
| `kernel.rebuild_initramfs` | `true` | Whether to rebuild the initramfs after changes |
| `kernel.ensure_vmlinux` | `true` | Whether to ensure both compressed (vmlinuz) and uncompressed (vmlinux) kernels are present |

## Dependencies

This role depends on the following roles:

- homelab_ops.packages.apt_install
- homelab_ops.packages.apt_uninstall

## Example Playbook

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.os.ubuntu
      vars:
        packages:
          install:
            - htop
            - tmux
            - vim
          uninstall:
            - nano
            - snapd
        kernel:
          modules:
            - br_netfilter
            - overlay
          sysctl:
            vm.swappiness: 10
            net.ipv4.ip_forward: 1
            net.bridge.bridge-nf-call-iptables: 1
          rebuild_initramfs: true
          ensure_vmlinux: true
```

See the [Molecule test playbook](../../molecule/ubuntu/converge.yml) and the [GitHub Actions workflow](../../../.github/workflows/test-os.yaml) for end-to-end examples.

## License

AGPL-3.0-only

## Author Information

This role was created by the homelab-ops team.
