# Contributing

Thanks for your interest in improving the **terraform-azure-container-registry**
module! Contributions of all kinds are welcome — bug reports, feature requests,
documentation and code.

## Getting started

1. Fork the repository and create a feature branch from `main`.
2. Make your changes.
3. Ensure all checks pass locally (see below).
4. Open a pull request using the provided template.

## Development requirements

- [Terraform](https://www.terraform.io/downloads) >= 1.6.3
- [terraform-docs](https://terraform-docs.io/) (to regenerate the README)
- [tfsec](https://github.com/aquasecurity/tfsec) (security scanning, run in CI)

## Local checks

Run the same checks CI runs before pushing:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform-docs -c pipelines/.terraform-docs.yaml .
tfsec .
```

## Conventions

- Keep the module **fully dynamic**: every provider argument/block should be
  driven by a typed variable using `optional()`.
- Update the `examples/` directory when you add or change a variable.
- Regenerate the README with terraform-docs after any variable/output change.
- Update `CHANGELOG.md` under the `## [Unreleased]` heading.
- Follow [Conventional Commits](https://www.conventionalcommits.org/) for commit
  messages (e.g. `feat:`, `fix:`, `docs:`).

## Releasing

Releases follow [Semantic Versioning](https://semver.org/). Maintainers publish a
new version via the Azure DevOps pipeline, which tags the repo and creates a
GitHub Release. The `CHANGELOG.md` `Unreleased` section is promoted to the new
version.

## Questions

Open a [discussion or issue](https://github.com/Think-Cube/terraform-azure-container-registry/issues)
or email **contact@thinkcube.dev**.
