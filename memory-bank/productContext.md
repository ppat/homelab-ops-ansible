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

## Repository Structure
- Ansible collections located at repository root
- Each collection contains roles representing different types of actions
- Roles are paired with Molecule tests, either collectively or individually
- CI/CD integration via GitHub Actions to run Molecule tests on pull requests