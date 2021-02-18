

locals {
    regex_string_to_match = format("%s%s%s", "^", var.MAL_CODE, "-")
    resource_group_name = (length(regexall(local.regex_string_to_match, var.name)) == 1? var.name: format("%s%s%s", var.MAL_CODE, "-", var.name))
}

resource "azurerm_resource_group" "example" {
  name     = local.resource_group_name
  location = "East US"
}