# Ansible Collection - homelab_ops.k3s

![k3s](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-k3s.yaml/badge.svg)

A collection for deploying and managing k3s clusters with GitOps capabilities through Flux CD. This collection provides roles for initial cluster setup, node management, and GitOps controller installation.

This collection completes the infrastructure provisioning workflow by:

1. Installing k3s on server and agent nodes
2. Configuring high availability when multiple servers are present
3. Setting up Flux CD for GitOps-based management
4. Facilitating cluster access through kubeconfig retrieval

## Roles

| Role | Description |
| --- | --- |
| [homelab_ops.k3s.fetch_kubeconfig](roles/fetch_kubeconfig/) | Fetches the kubeconfig file from a remote k3s server node to the Ansible controller node. |
| [homelab_ops.k3s.install_flux_service](roles/install_flux_service/) | Installs Flux CD on the k3s cluster. |
| [homelab_ops.k3s.install_k3s_service](roles/install_k3s_service/) | Installs and configures a new k3s node (server or agent) and joins it to an existing cluster if it's not the first server node. |

## Playbooks

The collection includes a playbook for orchestrating the cluster setup:

- [install.yaml](playbooks/install.yaml): Prompts for configuration values and installs k3s and Flux CD on the specified nodes.

### Install Playbook Parameters

The install playbook accepts the following parameters:

| Parameter | Required | Description |
| --- | --- | --- |
| `k3s_version` | yes | The version of k3s to install (e.g., "1.30.2+k3s1") |
| `flux_version` | yes | The version of Flux to install (e.g., "2.4.0") |
| `kustomize_version` | yes | The version of Kustomize to install (e.g., "5.4.1") |
| `node_type` | yes | The type of node to install ("server" or "agent") |
| `api_server_url` | no | The API server URL for joining existing cluster (required for agent nodes, leave blank for first server node) |
| `server_token` | no | The token for joining server nodes to the cluster (required for server nodes) |
| `agent_token` | yes | The token for joining agent nodes to the cluster (required for agent and server nodes) |
| `k3s_config_file` | no | Path to the k3s configuration file (optional) |
| `k3s_private_registry_file` | no | Path to the k3s private registry configuration file (optional) |
| `enable_cis_hardening` | no | Whether to enable CIS hardening (default: false) |
| `expose_metrics` | no | Whether to expose metrics externally (i.e., bind k3s services on 0.0.0.0) (default: false) |
| `local_kubeconfig` | yes | Path where the kubeconfig file should be saved locally |

### k3s Configuration File

The `k3s_config_file` parameter allows you to specify a YAML file containing k3s configuration options. For details on available configuration options and examples, see the [install_k3s_service role documentation](roles/install_k3s_service/README.md#role-variables).

## Usage

1. Install the collection:

    ```bash
    ansible-galaxy collection install homelab_ops.k3s
    ```

2. Create an inventory file with your k3s nodes:

    ```ini
    [k3s_servers]
    server1 ansible_host=192.168.1.101
    server2 ansible_host=192.168.1.102
    server3 ansible_host=192.168.1.103

    [k3s_agents]
    agent1 ansible_host=192.168.1.201
    agent2 ansible_host=192.168.1.202
    ```

3. Run the install playbook in the following order:

    ```bash
    # 1. First, install the initial server node (this must be done first as other nodes will join to it)
    ansible-playbook -u ubuntu --ask-become-pass homelab_ops.k3s.playbooks.install -l server1 -e "k3s_version=1.30.2+k3s1 flux_version=2.4.0 kustomize_version=5.4.1 node_type=server server_token=your-server-token agent_token=your-agent-token local_kubeconfig=~/.kube/config"

    # 2. Then, install any additional server nodes (these need different parameters than agent nodes)
    ansible-playbook -u ubuntu --ask-become-pass homelab_ops.k3s.playbooks.install -l "server2,server3" -e "k3s_version=1.30.2+k3s1 flux_version=2.4.0 kustomize_version=5.4.1 node_type=server api_server_url=https://server1:6443 server_token=your-server-token agent_token=your-agent-token local_kubeconfig=~/.kube/config"

    # 3. Finally, install all agent nodes
    ansible-playbook -u ubuntu --ask-become-pass homelab_ops.k3s.playbooks.install -l k3s_agents -e "k3s_version=1.30.2+k3s1 flux_version=2.4.0 kustomize_version=5.4.1 node_type=agent api_server_url=https://server1:6443 agent_token=your-agent-token local_kubeconfig=~/.kube/config"
    ```

See the [Molecule test playbooks](molecule/) and the [GitHub Actions workflow](../../.github/workflows/test-k3s.yaml) for end-to-end examples.

## Requirements

- Ansible 2.15 or newer
- The target nodes must have a supported operating system for k3s (see the [k3s documentation](https://docs.k3s.io/installation/requirements#operating-systems) for details)

## License

AGPL-3.0-only

## Author Information

This collection was created by the homelab-ops team.
