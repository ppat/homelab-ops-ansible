# Homelab Ops Ansible Collections

![lint](https://github.com/ppat/homelab-ops-ansible/actions/workflows/lint.yaml/badge.svg)

A suite of Ansible collections designed for efficient infrastructure automation. These collections focus on immutable infrastructure patterns and are optimized for homelab environments while being robust enough for production use.

## Core Principles

- **Immutable Infrastructure**: Replace rather than patch - making your infrastructure more reliable
- **Performance-Focused**: Tasks run only when needed, optimized for speed without compromising security
- **Declarative Configuration**: Define desired states clearly and achieve them consistently
- **Practical Solutions**: Following best practices while staying pragmatic

## Collections

| Collection | Capabilities | Status |
|------------|-------------|---------|
| [🔧 block_device](block_device/) | - Automated block device selection<br>- Partition management<br>- Filesystem creation<br>- RAM disk setup | ![block_device](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-block_device.yaml/badge.svg) |
| [⚙️ configure](configure/) | - Ansible environment setup<br>- Cloud-init configuration<br>- System configuration (fstab, etc.)<br>- Service configuration | ![configure](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-configure.yaml/badge.svg) |
| [☸️ k3s](k3s/) | - Automated k3s cluster deployment<br>- Multi-node cluster setup<br>- Flux CD integration<br>- Kubeconfig management | ![k3s](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-k3s.yaml/badge.svg) |
| [💻 os](os/) | - OS configuration and optimization<br>- System settings management | ![os](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-os.yaml/badge.svg) |
| [📦 packages](packages/) | - Package installation/removal<br>- URL-based package deployment<br>- Architecture-specific handling | ![packages](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-packages.yaml/badge.svg) |
| [🥧 raspberry_pi](raspberry_pi/) | - Kernel configuration<br>- Boot parameter management<br>- Pi-specific optimizations | ![raspberry_pi](https://github.com/ppat/homelab-ops-ansible/actions/workflows/test-raspberry_pi.yaml/badge.svg) |

## Key Features

- **Block Device Management**: Automated disk provisioning, partitioning, and filesystem setup
- **Kubernetes Deployment**: Streamlined k3s cluster setup with Flux CD integration
- **System Configuration**: Comprehensive OS and service configuration management
- **Package Handling**: Flexible package management across different architectures
- **Raspberry Pi Support**: Specialized tools for Pi-based infrastructure

## Getting Started

Each collection is designed for specific infrastructure needs:

- **Setting up storage?** → [block_device](block_device/) collection handles automated disk management
- **Deploying Kubernetes?** → [k3s](k3s/) collection provides streamlined cluster setup
- **Configuring systems?** → [configure](configure/) collection manages system settings
- **Managing packages?** → [packages](packages/) collection handles software deployment
- **Working with Raspberry Pi?** → [raspberry_pi](raspberry_pi/) collection offers Pi-specific tools

Visit each collection's documentation for detailed usage instructions and examples.

## Quality Assurance

- Comprehensive Molecule tests for each collection
- Continuous Integration via GitHub Actions
- Automated linting and syntax checking
- Detailed documentation requirements

## Contributing

We welcome contributions! See our [Contributing Guide](CONTRIBUTING.md) for:
- Development setup
- Code style guidelines
- Testing requirements
- Pull request process

## Community

- 🐛 Found a bug? [Open an issue](https://github.com/ppat/homelab-ops-ansible/issues)
- 💡 Have an idea? [Start a discussion](https://github.com/ppat/homelab-ops-ansible/discussions)
- 🤝 Want to contribute? Check our [Contributing Guide](CONTRIBUTING.md)

## License

This project is licensed under the GNU Affero General Public License v3.0 (AGPL-3.0) - see the [LICENSE](LICENSE) file for details.

---

<p align="center">
Built for the homelab community
</p>
