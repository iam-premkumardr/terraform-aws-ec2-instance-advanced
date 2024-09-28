resource "aws_key_pair" "my_key_pair" {
  key_name   = var.name
  public_key = file("~/.ssh/id_rsa.pub")  # Replace with the path to your public key file
}