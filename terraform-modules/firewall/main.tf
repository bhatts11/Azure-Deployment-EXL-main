resource "azurerm_public_ip" "firewall_pip" {
  name                = var.firewall_pip
  location            = var.location
  resource_group_name = var.rg_Name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_firewall" "firewall" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.rg_Name
  sku_name            = var.azfw_sku_name
  sku_tier            = var.azfw_sku_tier

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.firewall_pip.id
  }

  tags = var.tags
}

