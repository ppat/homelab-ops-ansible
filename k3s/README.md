# Ansible Collection - homelab_ops.k3s

![k3s](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-k3s.yaml/badge.svg)

This collection supplies roles that aid in performing first-time node setup of a k3s cluster.

## Roles

| role | description |
| --- | --- |
| [homelab_ops.k3s.bootstrap_flux](roles/bootstrap_flux/) | Prepares configmaps/secrets for flux bootstrap and link k8s cluster with flux configuration in git repository |
| [homelab_ops.k3s.initialize_k3s_host](roles/initialize_k3s_host/) | Initializes a new host with k3s |
| [homelab_ops.k3s.install_flux_service](roles/install_flux_service/) | Install flux on the kubernetes cluster |
| [homelab_ops.k3s.install_k3s_service](roles/install_flux_service/) | Installs and configures a new k3s node (and have it join an existing cluster if it's the first node) |
