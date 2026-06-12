# Security Policy

## Supported Versions

The latest released minor version of this module receives security fixes.

| Version | Supported          |
|---------|--------------------|
| latest  | :white_check_mark: |
| older   | :x:                |

## Reporting a Vulnerability

If you discover a security vulnerability in this module, please report it
privately. **Do not open a public GitHub issue for security problems.**

Email **contact@thinkcube.dev** with:

- A description of the vulnerability and its impact
- Steps to reproduce or a proof of concept
- Any suggested remediation

You can expect an initial acknowledgement within **72 hours**. Once the issue is
confirmed, a fix will be prepared and released, and you will be credited (unless
you prefer to remain anonymous).

## Scope

This module provisions Azure infrastructure. Please note that:

- Enabling `acr_admin_enabled` exposes admin credentials in Terraform state.
  Prefer managed identities / RBAC over the admin account where possible.
- The `admin_password` output is marked `sensitive` but will still be present in
  state — protect your state backend accordingly.
- Always review `terraform plan` output before applying in any environment.
