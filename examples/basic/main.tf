module "container_registry" {
  source = "github.com/Think-Cube/terraform-azure-container-registry?ref=v1.0.0"

  name                = "acrdevexample"
  resource_group_name = "rg-example"
  location            = "West Europe"
  sku                 = "Standard"

  tags = {
    environment = "dev"
    managed_by  = "terraform"
  }
}