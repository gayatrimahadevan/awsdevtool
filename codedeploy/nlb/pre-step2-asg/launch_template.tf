resource "aws_launch_template" "ec2-lt-public" {
  name          = "lt-public"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.small"
  network_interfaces {
    # the VPC subnet
    subnet_id       = tolist(data.aws_subnet_ids.public.ids)[0]
    security_groups = [aws_security_group.allow-ssh.id, aws_security_group.allow-lb.id]
  }
  key_name  = aws_key_pair.gk.key_name

  user_data = filebase64("user_data.sh")

  iam_instance_profile {
    name = aws_iam_instance_profile.cd-ec2-instance-profile.name
  }
  monitoring {
    enabled = true
  }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_launch_template" "ec2-lt-private" {
  name          = "lt-private"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.small"
  network_interfaces {
    associate_public_ip_address=false
    # the VPC subnet
    subnet_id       = tolist(data.aws_subnet_ids.private.ids)[0]
    security_groups = [aws_security_group.allow-ssh.id, aws_security_group.allow-lb.id]
  }
  key_name  = aws_key_pair.gk.key_name

  user_data = filebase64("user_data.sh")

  iam_instance_profile {
    name = aws_iam_instance_profile.cd-ec2-instance-profile.name
  }

  monitoring {
    enabled = true
  }
  lifecycle {
    create_before_destroy = true
  }
}

