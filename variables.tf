variable "region" {
  description = "The name of the AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "The name of the environment"
  type        = string
  default     = "dev"

}

variable "project" {
  description = "The name of the project"
  type        = string
}

variable "cidr_block" {
  description = "The vpc ip address space"
}

variable "name" {
  description = "The name of the resource being created"
  type        = string
}

variable "create_natgw" {
  description = "Create a nat gateway"
  type        = bool
  default     = false
}

variable "attach_vpc_to_cwan" {
  description = "Create vpc attachment to CloudWAN"
  type        = bool
  default     = false
}

variable "segment" {
  description = "The CloudWAN segment tag name"
  type        = string
  default     = ""

  validation {
    condition     = !(var.create_vpc_attachment == true && var.segment == "")
    error_message = "segment must be provided when create_vpc_attachment is true."
  }
}

variable "core_network_id" {
  description = "The CloudWAN core network ID"
  type        = string
  default     = ""

  validation {
    condition     = !(var.create_vpc_attachment == true && var.core_network_id == "")
    error_message = "core_network_id must be provided when create_vpc_attachment is true."
  }
}
