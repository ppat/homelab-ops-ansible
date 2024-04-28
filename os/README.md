# Ansible Collection - homelab_ops.os

![os](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-os.yaml/badge.svg)

This collection supplies roles that to configure OS's (e.g. Ubuntu Linux), primarily used during building an OS image.

## Roles

| role | description |
| --- | --- |
| [homelab_ops.os.ubuntu](roles/ubuntu/) | Configure OS (i.e. install needed software, configure kernel modules, sysctl parameters, build new initramfs, etc) |
