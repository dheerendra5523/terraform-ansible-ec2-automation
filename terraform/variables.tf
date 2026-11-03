variable "instances" {
  description = "EC2 instances with different operating systems"

  type = map(object({
    ami           = string
    instance_type = string
    os_family     = string
    volume_size   = number
    user          = string
  }))

  default = {
    "control-node-ubuntu" = {
      ami           = "ami-0c7632fb77f35db43"
      user          = "ubuntu"
      instance_type = "t3.micro"
      os_family     = "Ubuntu"
      volume_size   = 20
    }

    "worker-amazon" = {
      ami           = "ami-0f19324397f53458f"
      user          = "ec2-user"
      instance_type = "t3.micro"
      os_family     = "Amazon Linux"
      volume_size   = 15
    }

    "worker-red-hat" = {
      ami           = "ami-087d8c81764fb7292"
      user          = "ec2-user"
      instance_type = "t3.micro"
      os_family     = "Red Hat"
      volume_size   = 15
    }

    "worker-ubuntu" = {
      ami           = "ami-0c7632fb77f35db43"
      user          = "ubuntu"
      instance_type = "t3.micro"
      os_family     = "Ubuntu"
      volume_size   = 20
    }
  }
}
variable "ssh_key_path" {
  type    = string
  default = "/home/ubuntu/ssh_key_file"

}