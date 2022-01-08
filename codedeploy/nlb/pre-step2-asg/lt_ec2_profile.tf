#EC2 Code deploy role
resource "aws_iam_role" "cd-ec2-role" {
  name = "cd-ec2-codedeploy-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Name = "cd-ec2-codedeploy-role"
  }

}
resource "aws_iam_role_policy_attachment" "ec2_fullaccess_attach" {
  role       = aws_iam_role.cd-ec2-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
resource "aws_iam_role_policy_attachment" "ec2_s3fullaccess_attach" {
  role       = aws_iam_role.cd-ec2-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
resource "aws_iam_instance_profile" "cd-ec2-instance-profile" {
  name = "cd-ec2-instance-profile"
  role = aws_iam_role.cd-ec2-role.name
}
