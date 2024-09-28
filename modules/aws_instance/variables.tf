variable "ami_value" {
  description = "value for the aws ec2 ami"
}

variable "instance_types" {
  description = "value for the aws ec2 instance type"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stg" = "t2.medium"
    "prd" = "t2.xlarge"
  }
}

variable "selected_instance_type_key" {
  description = "Key of the selected instance type from the map"
  type        = string
  default     = "dev"  # Default to "t2.micro"
}


variable "subnet_id" {
  description = "value for aws ec2 subnet id"
}


variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the EC2 instance"
  type        = list(string)  # Specifies that this is a list of strings
}

variable "ssh_user" {
  description = "Username for the SSH connection"
  type        = string
  default     = "ec2-user"
}

variable "key_pair_name" {
  description = "Key Pair name"
  type        = string
  default     = "ec2-user"
}

variable "ssh_private_key" {
  description = "Path to the SSH private key"
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "inline_provision_commands" {
  description = "Commands to run with the remote-exec provisioner"
  type        = list(string)
  default     = [
    "sudo yum update -y",
    "sudo yum install -y httpd",
    "sudo systemctl start httpd"
  ]
}
