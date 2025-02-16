# Decision Log

## Key Architectural Decisions

### Documentation Organization Strategy
- **Decision:** Link Project Brief and Architecture Overview in CONTRIBUTING.md but not in README.md
- **Rationale:** This approach:
  - Keeps README.md focused on new users and getting started
  - Provides contributors with essential context in CONTRIBUTING.md
  - Ensures technical depth is available where most relevant
  - Maintains clear separation between user and contributor documentation

### K3s Security Configuration
- **Decision:** Use baseline Pod Security Admission configuration with specific namespace exemptions
- **Rationale:** Provides practical security that:
  - Balances security with usability
  - Accommodates essential system components
  - Reflects real-world deployment needs
  - Maintains compatibility with common cluster components

### K3s Metrics Strategy
- **Decision:** Configure metrics exposure specifically for Prometheus integration via kube-prometheus-stack
- **Rationale:** This approach:
  - Provides clear purpose for metrics exposure
  - Enables standard monitoring integration
  - Aligns with common operational practices
  - Considers security implications

## Implementation Decisions Pending Action
These decisions are based on findings detailed in [Implementation Review Findings](implementationReviewFindings.md):

### Role Consolidation
Reference: [Specific Findings and Recommendations](implementationReviewFindings.md#specific-findings-and-recommendations)
- **Decision:** Merge similar functionality in roles:
  - `apt_install` and `apt_uninstall` roles ([packages Collection](implementationReviewFindings.md#packages-collection))
  - `partition` and `filesystem` roles ([block_device Collection](implementationReviewFindings.md#block_device-collection))
  - `kernel_cmdline` and `kernel_config` roles ([raspberry_pi Collection](implementationReviewFindings.md#raspberry_pi-collection))
- **Rationale:** Improves maintainability and reduces code duplication

### Testing Enhancement
Reference: [Testing Coverage and Effectiveness](implementationReviewFindings.md#testing-coverage-and-effectiveness)
- **Decision:** Expand Molecule testing coverage for:
  - `unpack` role: Additional scenarios and edge cases
  - `provision` role: More hardware configurations
  - `fstab` role: Various configuration scenarios
- **Rationale:** Ensures reliability across different use cases
