# vpc
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# key pair
resource "aws_key_pair" "my_key" {
  key_name   = "my_key"
  public_key = file("${path.module}/my-key-pair.pub")
}

# security group
resource "aws_security_group" "my-sg" {
  name   = "my_sg"
  vpc_id = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["152.59.121.3/32"]
    description = "Allow SSH access from my IP address"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["152.59.121.3/32"]
    description = "Allow HTTP access from my IP address"

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}

# ec2
resource "aws_instance" "servers" {
  for_each               = var.instances
  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  key_name               = aws_key_pair.my_key.key_name
  root_block_device {
    volume_size = each.value.volume_size
    volume_type = "gp3"
  }
  tags = {
    Name       = each.key
    Os_family  = each.value.os_family
    Managed_by = "terraform"
    Project    = "ansible"
  }


}






