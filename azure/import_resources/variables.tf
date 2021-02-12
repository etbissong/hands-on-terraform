variable "res_grp_locale" {
  type    = string
}

variable "res_grp_name" {
  type  = string
}

variable "admin_username" {
  type        = string
  description = "Administrator user name for virtual machine"
}

variable "admin_password" {
  type        = string
  description = "Password must meet Azure complexity requirements"
}

variable "prefix" {
  type    = string
  default = "terra"
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "TF Azure"
    Dept        = "Infrastructure"
  }
}

variable "sku" {
    type = map(string)
  default = {
    westus2 = "16.04-LTS"
    eastus  = "18.04-LTS"
    eastus2 = "18.04-LTS"
  }
}

variable "az_vm_size" {
  type = string
  default = "Standard_D2s_v3"
}