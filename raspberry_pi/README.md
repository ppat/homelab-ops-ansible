# Ansible Collection - homelab_ops.raspberry_pi

![raspberry_pi](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-raspberry_pi.yaml/badge.svg)

This collection supplies roles for provisioning raspberry_pi devices.

## Roles

| role | description |
| --- | --- |
| [homelab_ops.raspberry_pi.kernel_cmdline](roles/kernel_cmdline/) | Configure the kernel cmdline of a raspberry pi device |
| [homelab_ops.raspberry_pi.kernel_config](roles/kernel_config/) | Create kernel config.txt for a raspberry pi device |
| [homelab_ops.raspberry_pi.provision](roles/provision/) | Provision a raspberry pi device's empty root device from an os image and configure it to boot |
