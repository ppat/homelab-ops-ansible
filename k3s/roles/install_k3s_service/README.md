homelab_ops.k3s.install_k3s_service
===================================

A role that installs and configures k3s nodes, managing cluster formation and node joining. This role handles initial node setup and cluster expansion.

This role initiates the k3s deployment workflow by:

1. Installing k3s with specified configuration
2. Joining nodes to existing clusters when applicable
3. Applying security hardening when enabled
4. Expose metrics endpoints when enabled (for scraping by prometheus)

Not intended for:

- Updating or upgrading existing k3s installations (use [system-upgrade-controller](https://docs.k3s.io/upgrades/automated))
- Installing/configuring system software (handle during OS image baking or configuring host to boot)

Requirements
------------

- Ansible 2.15 or newer
- This role must be run as root

Role Variables
--------------

| Variable | Default | Description |
| --- | --- | --- |
| `k3s.version` | undefined | The version of k3s to install |
| `k3s.discovery_url` | undefined | The URL of the k3s server to join (required for agent nodes) |
| `k3s.node.type` | undefined | The type of node to install (`server` or `agent`) |
| `k3s.node.config` | undefined | Path to the k3s configuration file |
| `k3s.tokens.server` | undefined | Token for server nodes to join the cluster |
| `k3s.tokens.agent` | undefined | Token for agent nodes to join the cluster |
| `k3s.hardening.enabled` | `false` | Whether to enable CIS hardening |
| `k3s.hardening.pod_security_admission` | undefined | Path to Pod Security Admission configuration file (optional, only used when hardening is enabled) |
| `k3s.hardening.audit_policy` | `default-audit-policy.yaml` | Path to audit policy file (optional, only used when hardening is enabled) |
| `k3s.expose_metrics` | `false` | Whether to expose metrics externally for Prometheus scraping via kube-prometheus-stack |
| `k3s.registry` | undefined | Path to the k3s private registry configuration file |
| `k3s.local_kubeconfig` | undefined | Path where the kubeconfig file should be saved locally |

The k3s configuration file (`k3s.node.config`) is a YAML file that can contain various k3s settings. For example:

```yaml
# Server configuration example
tls-san: "kubernetes-api.example.com"  # Additional hostnames/IPs for TLS certificates
flannel-backend: wireguard-native      # Network backend to use

disable:                               # Components to disable
- local-storage
- servicelb
- traefik

node-taint:                           # Node taints to apply
- 'node-role.kubernetes.io/control-plane=true:NoSchedule'
```

See the [k3s configuration reference](https://docs.k3s.io/installation/configuration) for all available options.

### Additional Configuration Options

The role provides several additional configuration options through its internal variables:

#### Standard File Locations

The following file paths are used by k3s:

```yaml
standard_locations:
  # Required files with fixed locations:
  k3s_config: /etc/rancher/k3s/config.yaml           # Main k3s configuration
  kubeconfig: /etc/rancher/k3s/k3s.yaml              # Cluster kubeconfig
  kubelet_config: /etc/rancher/k3s/kubelet.config    # Kubelet configuration

  # Optional files with fixed locations:
  registry: /etc/rancher/k3s/registries.yaml         # Private registry configuration (only needed if using private registries)

  # Optional files for CIS hardening (only used when k3s.hardening.enabled=true):
  pod_security_admission: /var/lib/rancher/k3s/server/psa.yaml  # Pod security admission config
  audit_policy: /var/lib/rancher/k3s/server/audit.yaml          # Audit policy configuration
```

These locations are fixed and cannot be changed through variables. However:

- The registry file is optional and only needed if you're using private registries (specified via `k3s.registry`)
- The pod security admission and audit policy files are only used when CIS hardening is enabled (`k3s.hardening.enabled=true`)
- The audit policy file can be customized by providing your own file via `k3s.hardening.audit_policy`

#### CIS Hardening Settings

CIS (Center for Internet Security) Hardening implements security best practices and configurations to enhance the security of your k3s cluster. These configurations align with the CIS Kubernetes Benchmark, which provides prescriptive guidance for establishing a secure configuration posture for Kubernetes. For more details, see the [k3s CIS Hardening Guide](https://docs.k3s.io/security/hardening-guide).

When `k3s.hardening.enabled` is set to `true`, the following security features are enabled:

```yaml
# kube-apiserver settings
- audit-log-path=/var/lib/rancher/k3s/server/logs/audit.log
- audit-policy-file=/var/lib/rancher/k3s/server/audit.yaml
- audit-log-maxage=30
- audit-log-maxbackup=10
- audit-log-maxsize=100
- request-timeout=300s
- service-account-lookup=true

# kube-controller-manager settings
- terminated-pod-gc-threshold=10
- use-service-account-credentials=true

# Additional security features
- Secrets encryption (enabled automatically)
- Pod Security Admission (if configured)
```

##### Pod Security Admission Configuration

Pod Security Admission enforces security standards for pods in your cluster. To enable it:

1. Create a Pod Security Admission configuration file with your desired policies. For example:

    ```yaml
    apiVersion: apiserver.config.k8s.io/v1
    kind: AdmissionConfiguration
    plugins:
    - name: PodSecurity
      configuration:
        apiVersion: pod-security.admission.config.k8s.io/v1
        kind: PodSecurityConfiguration
        defaults:
          enforce: "baseline"      # Default security level
          enforce-version: "latest"
          audit: "baseline"
          audit-version: "latest"
          warn: "baseline"
          warn-version: "latest"
        exemptions:
          namespaces:
          - "kube-system"      # System components need privileged access
          - "longhorn-system"  # Storage system needs special permissions
    ```

2. Provide the path to this file using the `k3s.hardening.pod_security_admission` variable:

    ```yaml
    k3s:
      hardening:
        enabled: true
        pod_security_admission: "/path/to/your/psa-config.yaml"
    ```

The file will be copied to `/var/lib/rancher/k3s/server/psa.yaml` and automatically configured in the kube-apiserver.

If no custom configuration is provided but hardening is enabled, no pod security standards will be configured. This is intended for use in scenarios where you will manage pod security standards externally through a tool like [kyverno](https://kyverno.io/policies/pod-security/). You have to configure pod security standards one way or another, if you wish to be compliant with CIS Hardening standards.

#### Metrics Exposure Settings

These settings configure k3s components to expose their metrics endpoints on all interfaces (0.0.0.0) instead of just localhost, allowing Prometheus (as installed by kube-prometheus-stack) to scrape metrics from these components. This is necessary for monitoring the health and performance of your k3s cluster through Prometheus and Grafana.

When `k3s.expose_metrics` is set to `true`, the following settings are applied:

For server nodes:

```yaml
- --kube-controller-manager-arg bind-address=0.0.0.0
- --kube-proxy-arg metrics-bind-address=0.0.0.0
- --kube-scheduler-arg bind-address=0.0.0.0
- --etcd-expose-metrics
```

For agent nodes:

```yaml
- --kube-proxy-arg metrics-bind-address=0.0.0.0
```

Dependencies
------------

None

Example Playbook
----------------

```yaml
# Cluster formation on first server node
- hosts: "{{ [k3s_servers[0]] }}"
  roles:
    - role: homelab_ops.k3s.install_k3s_service
      vars:
        k3s:
          version: "1.30.2+k3s1"
          discovery_url: ""  # Empty for first server node
          node:
            type: server
            config: "/path/to/server-config.yaml"
          tokens:
            server: "your-server-token"
            agent: "your-agent-token"
          hardening:
            enabled: true
          expose_metrics: false
          local_kubeconfig: "~/.kube/config"

# Remaining server nodes join the cluster
- hosts: "{{ k3s_servers[1:] }}"
  roles:
    - role: homelab_ops.k3s.install_k3s_service
      vars:
        k3s:
          version: "1.30.2+k3s1"
          discovery_url: "https://{{ k3s_servers[0] }}:6443"
          node:
            type: server
            config: "/path/to/server-config.yaml"
          tokens:
            server: "your-server-token"
            agent: "your-agent-token"
          hardening:
            enabled: true
          expose_metrics: false
          local_kubeconfig: "~/.kube/config"

# Installing an agent nodes
- hosts: k3s_agents
  roles:
    - role: homelab_ops.k3s.install_k3s_service
      vars:
        k3s:
          version: "1.30.2+k3s1"
          discovery_url: "https://{{ k3s_servers[0] }}:6443"
          node:
            type: agent
            config: "/path/to/agent-config.yaml"
          tokens:
            agent: "your-agent-token"
          hardening:
            enabled: true
          expose_metrics: false
```

See the [Molecule test playbook](../../molecule/default/converge.yml) and the [GitHub Actions workflow](../../../.github/workflows/test-k3s.yaml) for end-to-end examples.

License
-------

AGPL-3.0-only

Author Information
------------------

This role was created by the homelab-ops team.
