variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  validation {
    condition     = can(cidrnetmask(var.vpc_cidr_block))
    error_message = "VPC CIDR block must be valid."
  }
}

variable "subnet_cidr_block" {
  description = "CIDR block for Subnet"
  type        = string
  validation {
    condition     = can(cidrnetmask(var.subnet_cidr_block))
    error_message = "Subnet CIDR block must be valid."
  }
}

variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
}

variable "env_prefix" {
  description = "Environment prefix"
  type        = string
  default     = "prod"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "public_key" {
  description = "Path to SSH public key"
  type        = string
}

variable "private_key" {
  description = "Path to SSH private key"
  type        = string
}

variable "backend_servers" {
  description = "List of backend servers"
  type = list(object({
    name        = string
    script_path = string
  }))
}

variable "my_ip" {
  description = "Your public IP for SSH access"
  type        = string
}
