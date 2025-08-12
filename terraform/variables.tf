variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project base name"
  type        = string
  default     = "taskmanager"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources"
  type        = map(string)
  default = {
    Project     = "taskmanager"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 8000
}

variable "alb_port" {
  description = "Port that ALB listens on"
  type        = number
  default     = 80
}

variable "alb_protocol" {
  description = "Protocol used by ALB"
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Path for ALB health checks"
  type        = string
  default     = "/"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Owner       = "Gilbert Mutai"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
