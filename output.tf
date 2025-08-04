output "id" {
  description = "The ID of the Container Registry."
  value       = azurerm_container_registry.main.id
}

output "login_server" {
  description = "The URL that can be used to log into the Container Registry."
  value       = azurerm_container_registry.main.login_server
}

output "admin_username" {
  description = "The Username associated with the Container Registry Admin account - if the admin account is enabled."
  value       = azurerm_container_registry.main.admin_enabled ? azurerm_container_registry.main.admin_username : null
}

output "admin_password" {
  description = "The Password associated with the Container Registry Admin account - if the admin account is enabled."
  value       = azurerm_container_registry.main.admin_enabled ? azurerm_container_registry.main.admin_password : null
  sensitive   = true
}

output "data_endpoint_host_names" {
  description = "A set of data endpoint hostnames associated with the Container Registry - if data endpoints are enabled."
  value       = azurerm_container_registry.main.data_endpoint_enabled ? azurerm_container_registry.main.data_endpoint_host_names : null
}

output "identity" {
  description = "The identity details of the Container Registry, including principal_id and tenant_id, if a managed identity is configured."
  value = azurerm_container_registry.main.identity != null ? {
    principal_id = azurerm_container_registry.main.identity[0].principal_id
    tenant_id    = azurerm_container_registry.main.identity[0].tenant_id
  } : null
}