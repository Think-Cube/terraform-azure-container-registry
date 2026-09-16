output "id" {
  description = "The unique identifier of the Container Registry."
  value       = azurerm_container_registry.main.id
}

output "name" {
  description = "The name of the Container Registry."
  value       = azurerm_container_registry.main.name
}

output "login_server" {
  description = "The URL that can be used to log into the Container Registry."
  value       = azurerm_container_registry.main.login_server
}

output "admin_username" {
  description = "The Username associated with the Container Registry Admin account. Only populated when admin is enabled."
  value       = try(azurerm_container_registry.main.admin_username, null)
}

output "admin_password" {
  description = "The Password associated with the Container Registry Admin account. Only populated when admin is enabled."
  value       = try(azurerm_container_registry.main.admin_password, null)
  sensitive   = true
}
