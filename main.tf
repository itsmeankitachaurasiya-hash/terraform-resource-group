resource "azurerm_resource_group" "resource_block" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}
