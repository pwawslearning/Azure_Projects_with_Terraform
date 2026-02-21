variable "sub_id" {
  default = ""
}
variable "prefix" {
  default = "VNET_RG"
}
variable "location" {
  type    = list(string)
  default = ["Southeast Asia", "Japan East"]
}
variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16", "192.168.0.0/16"]
}

