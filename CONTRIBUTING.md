# Contributing to Homelab Ops Ansible Collections

Thank you for considering contributing to our project! 🎉 We value efficiency, clarity, and pragmatic solutions.

## 📚 Essential Documentation

Before contributing, please review these key documents:

- [Project Brief](projectBrief.md) - Understand our design principles, code organization, and project philosophy
- [Architecture Overview](memory-bank/architectureOverview.md) - Learn about collection dependencies, workflows, and technical architecture

These documents will help you align your contributions with our project's goals and technical approach.

## 🚀 Getting Started

1. **Fork and Clone**

   ```bash
   git clone https://github.com/YOUR-USERNAME/homelab-ops-ansible.git
   cd homelab-ops-ansible
   ```

2. **Set Up Environment**

   ```bash
   # Install poetry
   pipx install poetry

   # Install dependencies
   poetry install

   # Install pre-commit hooks
   pre-commit install
   ```

3. **Create Branch**

   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/your-bug-fix
   ```

## 📝 Style Guidelines

### File Structure

- Use `.yaml` extension for all collection and role files
- Use `.yml` extension only for molecule tests (molecule requirement)
- Follow collection structure as defined in `galaxy.yml`

### Key Style Rules

- Indentation: 2 spaces
- Line length: max 200 characters
- YAML file must start with `---`
- Use consistent spacing:
  - Max 1 space inside braces/brackets
  - Require space after comment marker
  - Max 2 consecutive empty lines

For complete style rules, refer to:

- `.ansible-lint` - Ansible linting configuration
- `.yamllint` - YAML syntax and style rules

### VSCode Integration

We provide pre-configured VSCode settings that enforce our style guidelines and integrate with our tools:

Required Extensions (will be prompted to install):

- `redhat.ansible` - Ansible language support and linting
- `redhat.vscode-yaml` - YAML language support with schema validation
- `timonwong.shellcheck` - Shell script linting
- `ms-python.python` - Python language support (needed for ansible-lint)
- `streetsidesoftware.code-spell-checker` - Spell checking in code and docs
- `editorconfig.editorconfig` - EditorConfig support for consistent styling

To use these settings:

1. Open the project in VSCode
2. Install recommended extensions when prompted
3. VSCode will automatically use our project-specific settings from:
   - `.vscode/settings.json` - Editor and tool configurations
   - `.vscode/extensions.json` - Recommended extensions

Note, you may want to disable `"ansible.validation.lint.enabled` within `.vscode/settings.json` if it slows down your vscode environment.

### Documentation

- Each collection needs a README.md with purpose and usage
- Each role needs a README.md with parameters and examples
- Keep documentation concise and focused

## 🧪 Testing

### Requirements

- Each collection must have molecule tests
- Tests must validate the collection's functionality
- All tests must pass in GitHub Actions before merge

### Running Tests Locally

```bash
# Install collection
poetry run ansible-galaxy collection install ./collection_name/

# Run tests for a collection
cd collection_name
poetry run molecule test --all --no-parallel
```

See corresponding github actions workflow for a full end-to-end example of how tests are run.

## 📥 Submitting Changes

1. **Commit Changes**

   ```bash
   git add .
   git commit -m "feat: add new feature" # or "fix: resolve issue"
   ```

   Follow [Conventional Commits](https://www.conventionalcommits.org/)

2. **Update Fork**

   ```bash
   git remote add upstream https://github.com/ppat/homelab-ops-ansible.git
   git fetch upstream
   git rebase upstream/main
   ```

3. **Create Pull Request**
   - Push changes
   - Open PR via GitHub
   - Ensure all checks pass

## 🔍 Code Review

- Maintainers will review your PR
- Address any requested changes
- Be responsive to feedback
- All checks must pass before merge

## ❓ Questions?

- [Discussions](https://github.com/ppat/homelab-ops-ansible/discussions) for questions
- [Issues](https://github.com/ppat/homelab-ops-ansible/issues) for bugs
- Tag maintainers for urgent matters

Thank you for contributing! 🙏
