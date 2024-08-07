# Ansible Collection - homelab_ops.k3s

![k3s](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-k3s.yaml/badge.svg)

This collection supplies roles that aid in performing first-time node setup of a k3s cluster.

## Roles

| role | description |
| --- | --- |
| [homelab_ops.k3s.fetch_kubeconfig](roles/fetch_kubeconfig/) | Fetch a kubeconfig file from remote inventory host to the controller node |
| [homelab_ops.k3s.install_flux_service](roles/install_flux_service/) | Install flux on the kubernetes cluster |
| [homelab_ops.k3s.install_k3s_service](roles/install_flux_service/) | Installs and configures a new k3s node (and have it join an existing cluster if it's the first node) |
