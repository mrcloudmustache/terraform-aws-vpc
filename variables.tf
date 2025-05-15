variable "region"  {
    description = "The name of the AWS region"
    type = string
    default = "us-east-1"
}

variable "environment" {
    description = "The name of the environment"
    type = string
    # default = "dev"

    # validation {
    #   condition = var.environment == "prod" || var.environment == "dev"
    #   error_message = "The environment name must be 'prod' or 'dev'."
    # }
  
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
  description = "Create the nat gateway defaults to false"
  type        = bool
  default     = false
}

variable "segment" {
  description = "The Cloud WAN segment name"
  type        = string
  default     = "development"
}

variable "core_network_id" {
  description = "The Cloud WAN core network ID"
  type        = string
  default     = ""
}


# variable "public_key_path" {
#   description = "Path to the local SSH public key file"
#   type        = string
#   default     = "~/.ssh/id_rsa.pub" # Replace with your actual public key path
# }
