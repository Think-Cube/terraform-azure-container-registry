output "id" {
  description = "The ID of the Container Registry."
  value       = azurerm_container_registry.main.id
  sensitive   = false
}
output "login_server" {
  description = "The URL that can be used to log into the container registry."
  value       = azurerm_container_registry.main.login_server
  sensitive   = false
}
output "admin_username" {
  description = "The Username associated with the Container Registry Admin account - if the admin account is enabled."
  value       = azurerm_container_registry.main.admin_username
  sensitive   = true
}
output "admin_password" {
  description = "The Password associated with the Container Registry Admin account - if the admin account is enabled."
  value       = azurerm_container_registry.main.admin_password
  sensitive   = true
}
