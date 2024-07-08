# Ansible Collection - homelab_ops.k3s

![k3s](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-k3s.yaml/badge.svg)

This collection supplies roles that aid in performing first-time node setup of a k3s cluster.

## Roles

| role | description |
| --- | --- |
| [homelab_ops.k3s.bootstrap_flux](roles/bootstrap_flux/) | Bootstraps flux on kuberenetes cluster (i.e. links flux system within the cluster to a flux source such as a git repository containing the cluster configuration to be applied via flux) |
| [homelab_ops.k3s.install_flux_service](roles/install_flux_service/) | Install flux on the kubernetes cluster |
| [homelab_ops.k3s.install_k3s_service](roles/install_flux_service/) | Installs and configures a new k3s node (and have it join an existing cluster if it's the first node) |
