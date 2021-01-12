variable "name_separator" {
  description = "the character to use to separate the strings used to build the name - override with empty string if none required"
  type        = string
  default     = "-"
}

variable "name_strings" {
  description = "a list of strings to concatenate into a name - useful when templating a naming convention"
  type        = list(string)
}

variable "location" {
  description = "the location in which to deploy the resources"
  type        = string
}

variable "resource_group_name" {
  description = "the name of the resource group to place the resource in"
  type        = string
}

variable "sku" {
  description = "(Optional) The SKU name of the container registry."

  validation {
    condition     = var.sku == "Classic" || var.sku == "Basic" || var.sku == "Standard" || var.sku == "Premium"
    error_message = "Possible values are Basic, Standard and Premium. Classic (which was previously Basic) is supported only for existing resources."
  }
}

variable "admin_enabled" {
  description = "(Optional) Specifies whether the admin user is enabled"
  default     = "true"

  validation {
    condition     = var.admin_enabled == "true" || var.admin_enabled == "false"
    error_message = "Possible values are True and False."
  }
}

variable "georeplication_locations" {
  description = "(Optional) A list of Azure locations where the container registry should be geo-replicated."
  default     = null
}

variable "tags" {
  type        = map(any)
  description = "(Optional) A map of tags to assign to the resource."
  default     = {}
}
