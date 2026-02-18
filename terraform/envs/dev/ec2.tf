resource "aws_instance" "wp_web_public_01" {
  # Keep these as your placeholders / current values
  ami           = "ami-00ca570c1b6d79f36"
  instance_type = "t3.micro"

  subnet_id              = "subnet-0dfd29535106d0ac"
  vpc_security_group_ids = ["sg-0e40eaea06622d788"]

  tags = {
    Name        = "wp-web-public-01"
    Environment = "dev"
    Project     = "aws-devops-photography"
    Owner       = "jitesh"
    ManagedBy   = "terraform"
  }

  lifecycle {
    prevent_destroy = true

    # IMPORTANT: ignore these for imported resources so TF doesn't try to replace the EC2
    ignore_changes = [
      ami,
      subnet_id,
      vpc_security_group_ids,
      user_data,
      user_data_base64,
      key_name,
      associate_public_ip_address,
      private_ip,
      ipv6_addresses,
      ipv6_address_count,
      source_dest_check,
      credit_specification,
      cpu_options,
      metadata_options,
      enclave_options,
      private_dns_name_options,
      root_block_device,
      ebs_block_device
    ]
  }
}
resource "aws_instance" "bastion_host" {
  ami                    = "ami-xxxxxxxxxxxxx" # we will adjust after import
  instance_type          = "t3.micro"
  subnet_id              = "subnet-xxxxxxxxxxxxx"
  vpc_security_group_ids = ["sg-xxxxxxxxxxxxx"]
  key_name               = "your-key-name"

  tags = {
    Name = "bastion-host"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      ami,
      user_data,
      vpc_security_group_ids,
      subnet_id,
      key_name
    ]
  }
}
resource "aws_instance" "private_web_1" {
  ami                    = "ami-xxxxxxxxxxxxxxxxx" # will adjust after import
  instance_type          = "t3.micro"
  subnet_id              = "subnet-xxxxxxxxxxxxxxxxx"
  vpc_security_group_ids = ["sg-xxxxxxxxxxxxxxxxx"]
  key_name               = "your-key-name"

  tags = {
    Name = "private-web-1"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      ami,
      subnet_id,
      vpc_security_group_ids,
      user_data,
      user_data_base64,
      key_name,
      associate_public_ip_address,
      private_ip,
      ipv6_addresses,
      ipv6_address_count,
      source_dest_check,
      credit_specification,
      cpu_options,
      metadata_options,
      enclave_options,
      private_dns_name_options,
      root_block_device,
      ebs_block_device
    ]
  }
}
resource "aws_eip" "wp_eip" {
  domain = "vpc"

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      instance,
      associate_with_private_ip
    ]
  }
}
