variable "resource_group_name" {
    description = "Rg Name"
    default = "oa-rg-sa-burpsuite-hub-001"
}

variable "location" {
    description = "Location where our Rg is deployed"
    default = "eastus2"
  
}
variable "container_access_type" {
    description = "Acces type to use in a container"
    default = "private"

}