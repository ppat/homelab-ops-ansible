# Project Brief

Welcome to our suite of Ansible collections designed to simplify the creation of playbooks for infrastructure operations. While these collections are geared for homelab environments, they're flexible enough to address any use case where robust infrastructure automation is needed.

## Code Organization and SDLC Practices

Our repository is structured for clarity and maintainability:

- **Ansible Collections**: This project houses ansible collections for the [homelab-ops](https://galaxy.ansible.com/ui/namespaces/homelab_ops/) namespace with each collection located at repository root.
- **Roles**: Each collection includes various roles, each representing different types of actions.
- **Molecule Tests**:
  - Every role is paired with a corresponding Molecule test to validate its functionality.
  - Depending on the collection, you might find:
    - A single Molecule scenario (i.e. `default`) that tests all roles collectively, or
    - Individual Molecule scenarios for testing each role separately.
    - While individual molecule scenarios for each role is preferred, in some use cases, it's not easy test a role in isolation, you need all constituent roles collectively to test them.
- **CI/CD Integration**: GitHub Actions workflows automatically orchestrate these molecule tests during pull requests, ensuring continuous validation.

## Design Principles

Our design approach is focused on delivering a reliable, performant, and secure user experience:

- **Immutable Infrastructure**:
  - The collections are geared toward first-run deployments rather than iterative patching.
  - They are used for building OS images (using Packer) or deploying an existing image onto a disk of a chosen host and configuring it to boot.
  - Instead of patching existing infrastructure, we replace it entirely—thus, best practices that focus on maintaining existing systems are not applicable here.
  - Although there may be rare deviations, replacement is the norm.

- **Performance and Efficiency**:
  - *Idempotence*: Tasks execute only when necessary; if a task isn't required, it won't run.
  - *Speed*: When possible, we favor faster, even if slightly non-idiomatic (or "hacky"), solutions—as long as they don't compromise security.
  - *Real-world safety over performative safety*: We acknowledge that some built-in Ansible modules are flagged as unsafe by official documentation. However, within the context of our specific use cases, we make informed decisions on their safety.

- **Declarative, No-Op Behavior**:
  - Users define a desired state via a specification, and the collections ensure that state is achieved.
  - If the infrastructure already matches the desired state, the process is a no-op (or nearly so).

- **Best Practices with Practical Flexibility**:
  - We adhere to established Ansible and infrastructure-as-code best practices, except when they conflict with our core goals.
  - Our approach is to follow the spirit of these practices rather than the letter of the law.

By incorporating these principles, our Ansible collections are designed to be reliable, efficient, and secure—empowering you to manage your infrastructure with confidence.
