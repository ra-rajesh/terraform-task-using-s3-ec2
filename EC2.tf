# Configure the AWS EC2 Instance
resource "aws_instance" "MyEC2_Terraform" {
  ami                         = "ami-005fc0f236362e99f" # Replace with the AMI ID for your desired OS (e.g., Amazon Linux, Ubuntu)
  instance_type               = "t2.micro"              # Change instance type if needed (e.g., t2.small, t2.medium, etc.)
  subnet_id                   = aws_subnet.VPc_Pub_Subnet_Terraform.id
  key_name                    = "DevOpskey"                            # Replace with the name of your key pair (you need to create or import it)
  vpc_security_group_ids      = [aws_security_group.MySG_Terraform.id] # Associate the security group created earlier
  associate_public_ip_address = true                                   # Enable public IP address on launch (for a public instance)
  availability_zone           = "us-east-1a"

  tags = {
    Name  = "MyEC2_Terraform"
    Owner = "Rajesh"
  }

}
