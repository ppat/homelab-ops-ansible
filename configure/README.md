# Ansible Collection - homelab_ops.configure

![configure](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-configure.yaml/badge.svg)

This collection supplies roles that aid in configuring various OS settings and services.

## Roles

| role | description |
| --- | --- |
| [homelab_ops.configure.ansible](roles/ansible/) | Install ansible-core, python dependencies and any needed collections |
| [homelab_ops.configure.cloud_init](roles/cloud_init/) | Create cloud-init configuration (userdata, etc) |
| [homelab_ops.configure.fstab](roles/fstab/) | Generates a fstab file. |
