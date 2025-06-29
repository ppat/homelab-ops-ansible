# Product Context

## Project Overview

This project is a suite of Ansible collections designed to simplify the creation of playbooks for infrastructure operations. While optimized for homelab environments, the collections are flexible enough to address any use case where robust infrastructure automation is needed.

## Goals

- Provide reliable, high-performance, and secure infrastructure automation
- Simplify playbook creation for common infrastructure operations
- Support immutable infrastructure practices
- Adhere to best practices while allowing practical flexibility

## Key Principles

- **Immutable Infrastructure**: The collections are geared toward first-run deployments and replacing infrastructure rather than iterative patching.
- **Performance and Efficiency**: Tasks execute only when necessary and favor faster solutions that don't compromise security.
- **Declarative, No-Op Behavior**: Users define a desired state and the collections ensure that state is achieved. If infrastructure already matches, the process is a no-op.
- **Best Practices with Practical Flexibility**: The collections follow the spirit of established guidelines rather than the letter of the law when it aligns with project goals.

## Implementation Guidelines

- **Security First**: All roles follow security best practices, including secure configuration management and regular dependency updates.
- **Performance Optimization**: Tasks are designed for optimal execution speed and resource utilization.
- **Testing Coverage**: Each role includes comprehensive Molecule tests covering various scenarios and edge cases.
- **Documentation Standards**: All collections and roles maintain detailed, up-to-date documentation following Ansible Galaxy conventions.

## Repository Structure

- Ansible collections located at repository root
- Each collection contains roles representing different types of actions
- Roles are paired with Molecule tests, either collectively or individually
- CI/CD integration via GitHub Actions to run Molecule tests on pull requests

## Technical Requirements

- Ansible 2.15 or newer
- Python 3.10 or newer
- Specific OS versions and packages as noted in individual role README files
- Python dependencies for development and testing managed via poetry

## Documentation Organization

- README.md: Focus on new users and getting started
- CONTRIBUTING.md: Technical depth for contributors, including architecture overview
- Collection READMEs: Overview of included roles and example playbooks
- Role READMEs: Detailed usage, variables, and dependencies
