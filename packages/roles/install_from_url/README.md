# homelab_ops.packages.install_from_url

A role that installs packages from URLs in archive or binary formats. This role handles package downloads and installation for image building and system provisioning.

This role manages URL-based installation by:

1. Validating package sources
2. Downloading content
3. Installing packages
4. Setting up permissions

Not intended for upgrading existing packages.

## Requirements

- Ansible 2.10 or newer
- This role must be run as root
- The target system must have the necessary tools installed to handle the package format (e.g., `tar` for archives, `chmod` for binaries)

## Role Variables

| Variable | Default | Description |
| --- | --- | --- |
| `package.name` | undefined | The name of the package being installed |
| `package.url` | undefined | The URL to download the package from |
| `package.path` | undefined | The path where the package should be installed |
| `package.mode` | undefined | The file mode to set on the installed package |
| `package.unarchive_extra_opts` | `[]` | Additional options to pass to the `unarchive` module (only for archive packages) |
| `package.archive_package_name` | undefined | The name of the package within the archive (only for archive packages) |

## Dependencies

None

## Example Playbook

```yaml
- hosts: servers
  roles:
    - role: homelab_ops.packages.install_from_url
      vars:
        package:
          name: terraform
          version: 1.4.6
          url: "https://releases.hashicorp.com/terraform/{{ version }}/terraform_{{ version }}_linux_amd64.zip"
          path: /usr/local/bin
          mode: '0755'
          unarchive_extra_opts: [--strip-components=1]
```

See the following Molecule test playbooks and GitHub Actions workflows for end-to-end examples:

- [Install package from archive at URL](../../molecule/install_from_url.package_as_archive/converge.yml)
  - [GitHub Actions workflow](../../../.github/workflows/test-packages.yaml)
- [Install package from binary at URL](../../molecule/install_from_url.package_as_binary/converge.yml)
  - [GitHub Actions workflow](../../../.github/workflows/test-packages.yaml)

## License

AGPL-3.0-only

## Author Information

This role was created by the homelab-ops team.
