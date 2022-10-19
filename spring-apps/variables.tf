variable "subscription" {
    type = string
    description = "Azure Subscription"
}

variable "service_name" {
  description = "The name of Spring Apps service instance"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name where host the Spring Apps service instance"
  type        = string
}
