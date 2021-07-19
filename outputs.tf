
output "custom_role_id" {
  value       = local.custom-role-output
  description = "ID of the custom role created."
}

output "bindings_by_member" {
  value       = local.bindings_by_member
  description = "List of bindings for entities unwinded by members."
}

output "set_authoritative" {
  value       = local.set_authoritative
  description = "A set of authoritative binding keys (from bindings_authoritative) to be used in for_each. Unwinded by roles."
}

output "set_additive" {
  value       = local.set_additive
  description = "A set of additive binding keys (from bindings_additive) to be used in for_each. Unwinded by members."
}

output "bindings_authoritative" {
  value       = local.bindings_authoritative
  description = "Map of authoritative bindings for entities. Unwinded by roles."
}

output "bindings_additive" {
  value       = local.bindings_additive
  description = "Map of additive bindings for entities. Unwinded by members."
}



output "organizations" {
  value       = distinct(module.helper.bindings_by_member[*].name)
  description = "Organizations which received bindings."
  depends_on  = [google_organization_iam_binding.organization_iam_authoritative, google_organization_iam_member.organization_iam_additive, ]
}

output "roles" {
  value       = distinct(module.helper.bindings_by_member[*].role)
  description = "Roles which were assigned to members."
}

output "members" {
  value       = distinct(module.helper.bindings_by_member[*].member)
  description = "Members which were bound to organizations."
}


output "projects" {
  value       = distinct(module.helper.bindings_by_member[*].name)
  description = "Projects wich received bindings."
  depends_on  = [google_project_iam_binding.project_iam_authoritative, google_project_iam_member.project_iam_additive, ]
}

output "roles" {
  value       = distinct(module.helper.bindings_by_member[*].role)
  description = "Roles which were assigned to members."
}

output "members" {
  value       = distinct(module.helper.bindings_by_member[*].member)
  description = "Members which were bound to projects."
}


