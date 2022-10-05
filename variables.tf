variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
  sensitive   = false
  validation {
    condition     = length(var.instance_name) > 4
    error_message = "Instance names must be of a length greater than 4." 
  }
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1"]
}

// More complex list example
variable "available_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [
    {
      external = 5300
      internal = 5300
      protocol = "TCP"
    }
  ]  
}