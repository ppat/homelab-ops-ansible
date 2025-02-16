homelab_ops.k3s.install_flux_service
====================================

A role that installs Flux CD on k3s clusters, enabling GitOps workflows. This role completes the cluster setup by adding declarative configuration management.

This role completes the k3s deployment workflow by:

1. Installing required CLIs (flux, kustomize)
2. Deploying Flux controllers and CRDs
3. Preparing the cluster for GitOps-based management

Not intended for updating or upgrading Flux. That should be done through changes to the Git (or OCI) source that Flux is connected to.

Requirements
------------

- Ansible 2.15 or newer
- This role must be run as root

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `flux.version` | undefined | The version of Flux to install |
| `flux.local_kubeconfig` | undefined | Path to the kubeconfig file for accessing the cluster |
| `kustomize.version` | undefined | The version of Kustomize to install |

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: k3s_servers
  roles:
    - role: homelab_ops.k3s.install_flux_service
      vars:
        flux:
          version: "2.4.0"
          local_kubeconfig: "~/.kube/config"
        kustomize:
          version: "5.4.1"
```

See the [Molecule test playbook](../../molecule/default/converge.yml) and the [GitHub Actions workflow](../../../.github/workflows/test-k3s.yaml) for end-to-end examples.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
