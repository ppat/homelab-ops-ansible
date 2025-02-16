homelab_ops.k3s.fetch_kubeconfig
====================================

A role that manages kubeconfig retrieval from k3s clusters. This role completes the cluster access workflow by securely transferring and configuring cluster credentials.

This role completes the k3s access workflow by:

1. Fetches a kubeconfig file from a remote node's location to a local location (only if it does not already exist at the local location)
2. Updates the references to the apiserver URL in the fetched file to refer to the remote node's hostname

Requirements
------------

- Ansible 2.15 or newer
- This role must be run as root

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `k3s.local_kubeconfig` | undefined | Path where the kubeconfig file should be saved locally |

Dependencies
------------

None

Example Playbook
----------------

```yaml
- hosts: k3s_servers
  roles:
    - role: homelab_ops.k3s.fetch_kubeconfig
      vars:
        k3s:
          local_kubeconfig: "~/.kube/config"
```

See the [Molecule test playbook](../../molecule/default/converge.yml) and the [GitHub Actions workflow](../../../.github/workflows/test-k3s.yaml) for end-to-end examples.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
