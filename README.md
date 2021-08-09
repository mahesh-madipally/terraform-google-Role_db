# Module Custom Role IAM

This optional module is used to create custom roles at organization or project level. The module supports creating custom rules optionally using predefined roles as a base, with additional permissions or excluded permissions.

Permissions that are [unsupported](https://cloud.google.com/iam/docs/custom-roles-permissions-support) from custom roles are automatically excluded.

## Usage - Custom Role at Organization Level

```hcl
module "org-custom-role" {
  source = "mahesh-madipally/db_Role_template/google"

  target_level         = "org"
  target_id            = "123456789"
  role_id              = "custom_role_id"
  title                = "Custom Role Unique Title"
  description          = "Custom Role Description"
  base_roles           = ["roles/iam.serviceAccountAdmin"]
  permissions          = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
  excluded_permissions = ["iam.serviceAccounts.setIamPolicy"]
}
```

## Usage - Custom Role at Project Level

```hcl
module "project-custom-role" {
 source = "mahesh-madipally/db_Role_template/google"

  target_level         = "project"
  target_id            = "project_id_123"
  role_id              = "custom_role_id"
  title                = "Custom Role Unique Title"
  description          = "Custom Role Description"
  base_roles           = ["roles/iam.serviceAccountAdmin"]
  permissions          = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
  excluded_permissions = ["iam.serviceAccounts.setIamPolicy"]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| base\_roles | List of base predefined roles to use to compose custom role. | `list(string)` | `[]` | no |
| description | Description of Custom role. | `string` | `""` | no |
| excluded\_permissions | List of permissions to exclude from custom role. | `list(string)` | `[]` | no |
| members | List of members to be added to custom role. | `list(string)` | n/a | yes |
| permissions | IAM permissions assigned to Custom Role. | `list(string)` | n/a | yes |
| role\_id | ID of the Custom Role. | `string` | n/a | yes |
| stage | The current launch stage of the role. Defaults to GA. | `string` | `"GA"` | no |
| target\_id | Variable for project or organization ID. | `string` | n/a | yes |
| target\_level | String variable to denote if custom role being created is at project or organization level. | `string` | `"project"` | no |
| title | Human-readable title of the Custom Role, defaults to role\_id. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| custom\_role\_id | ID of the custom role created. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
