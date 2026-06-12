# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Bumped the `azurerm` provider to `4.77.0`.
- `resource_group_location` is now a required input (the resource group data
  source lookup was removed).
- Renamed `retention_policy` (number) to `retention_policy_in_days` and
  `trust_policy { enabled }` to the `trust_policy_enabled` boolean to match the
  provider's flattened arguments.
- `network_rule_set.ip_rules` (list of strings) replaced by
  `network_rule_set.ip_rule` (list of objects) so the rule `action` is dynamic.

### Added

- `timeouts` block (create/read/update/delete).
- Optional sub-attributes on `georeplications` and optional `identity.identity_ids`.
- GitHub community-health files (Code of Conduct, Contributing, Security policy,
  issue/PR templates, CODEOWNERS).

### Removed

- Unused required `environment` variable.
- Unused `azurerm_client_config` and `azurerm_resource_group` data sources.

### Fixed

- `output.identity` no longer errors when no managed identity is configured.
- Example `source` paths corrected to `../../`.

[Unreleased]: https://github.com/Think-Cube/terraform-azure-container-registry/commits/main
