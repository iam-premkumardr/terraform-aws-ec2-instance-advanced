#Configure the aws provider
provider "aws" {
region = "ap-southeast-2"
}

# create an aws ec2 instance
resource "aws_instance" "my_instance" {
  ami = var.ami_value
  instance_type = var.instance_types[var.selected_instance_type_key]
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  associate_public_ip_address  = true  # Explicitly associate a public IP can be disabled
  key_name = var.key_pair_name
# Remote-exec provisioner that is configurable with variables
  provisioner "remote-exec" {
    inline = var.inline_provision_commands
    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.ssh_private_key)
      host        = self.public_ip
    }
  }  
}
