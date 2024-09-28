#Call the module to create vpc 
module "vpc" {
  source = "../../modules/aws_vpc"
  cidr_block = "10.1.0.0/16" #change this value 
}

#Call the module to create subnet
module "subnet" {
  source = "../../modules/aws_subnet"
  vpc_id=module.vpc.vpc_id
  cidr_block = "10.1.1.0/24" #change this value 
  availability_zone = "ap-southeast-2a"
}

#Call the module to create networking
module "networking" {
  source = "../../modules/aws_networking"
  subnet_ids=[module.subnet.subnet_id]
  vpc_id=module.vpc.vpc_id
}

#Call the module to create security groups
module "security_groups" {
 source = "../../modules/aws_security_groups"
 vpc_id=module.vpc.vpc_id
 ingress_rules=[ #change this block
   {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
  egress_rules =[ #change this block 
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

#Call the module to create ec2 instance
module "key_pair" {
  source = "../../modules/aws_key_pair"
  name ="keypair-${var.environment}"
}

#Call the module to create ec2 instance
module "ec2_instance" {
  source = "../../modules/aws_instance"
  key_pair_name = module.key_pair.key_pair_name
  ami_value = "ami-0474411b350de35fb"  #change this value 
  selected_instance_type_key = "${var.environment}"   # Default "dev" to "t2.micro"
  subnet_id = module.subnet.subnet_id
  vpc_security_group_ids = [module.security_groups.security_group_id]
  inline_provision_commands = [
    # Inline provision commands
    "sudo yum update -y",
    "sudo yum install -y httpd",
    "sudo systemctl start httpd"
  ]  
}
#Output the value required
output "public-ip-address" {
  value = module.ec2_instance.public-ip-address
}