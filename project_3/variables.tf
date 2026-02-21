variable "prefix" {
  type        = string
  description = "project_name"
  default     = "project-03"
}

variable "location" {
  type        = list(string)
  description = "the location of resources"
  default     = ["Southeast Asia", "Korea Central", "Japan East"]
}
variable "availible_networks" {
  type        = string
  description = "The network subnet of VNET"
  default     = "10.0.0.0/16"
}

# variable "bool" {
#   type        = bool
#   description = "option to delete os disk on termination"
#   default     = true
# }

# variable "subscription_id" {
#   type = string
#   default = ""
# }

# variable "vm_name" {
#   type = set(string)
#   default = [ "demo-vm01", "demo-vm02" ]
# }